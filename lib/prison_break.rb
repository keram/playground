module PrisonBreak
  class Visit
    attr_accessor :free_prisoner
    attr_reader :prison, :payload

    DISABLED_SYMBOLS = %w{, ` ( ? ! +}
    DISABLED_WORDS = %w{send eval system exec popen rm puts require new load create file include free call push concat}

    GUARD_RE = Regexp.new((DISABLED_SYMBOLS + DISABLED_WORDS).map {|i| Regexp.escape(i) }.join('|'))

    def initialize(prison, payload)
      @prison = prison
      @payload = payload
    end

    def secure?
      if !GUARD_RE.match(payload).nil?
        raise "Unpermitted item: #{Regexp.last_match(0)}"
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
