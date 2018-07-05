module PrisonBreak
  class Visit
    attr_accessor :free_prisoner
    attr_reader :prison, :payload

    def initialize(prison, payload)
      @prison = prison
      @payload = payload
    end

    def secure?
      if !payload.match(/(,|\.send|eval|call|\()/).nil?
        raise "Unpermitted item #{$1}"
      end

      true
    end

    def perform
      instance_eval(payload)
    end
  end

  class Prison
    def initialize
      @cells = {
        11 => ['Edmond Dantès'],
        22 => ['Henri Charrière'],
        33 => ['Michael Scofield']
      }.freeze
    end

    def empty_cell?
      cells.values.any? &:empty?
    end

    private

    attr_reader :cells

    def unlock(cell, password, guest)
      if password == 'secret'
        guest.free_prisoner = cells[cell].shift
      end
    end
  end
end
