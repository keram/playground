require 'prison_break'

class Escape < ApplicationRecord
  scope :with_organiser, -> { where.not(organiser: [nil, '']) }

  scope :successful, -> { where(success: true) }

  validates :payload, presence: true
  validates :organiser, presence: true, if: ->(escape) {
    escape.success? && escape.persisted?
  }

  before_create :execute

  def execute
    prison = PrisonBreak::Prison.new
    visit = PrisonBreak::Visit.new(prison, payload)
    visit.perform if visit.secure?

    self.prisoner = visit.free_prisoner
    self.success = prison.empty_cell? && prisoner.present?
  rescue StandardError => err
    self.error_message = err.message
  end
end
