require 'matrix'

module Knot
  class Grid < Matrix
    attr_reader :position

    def position x, y
      @position = Vector[x, y]
      self[*@position]
    end

    def rel x, y
      self[*@position + Vector[x, y]]
    end

    def n
      rel -1, 0
    end

    def ne
      rel -1, 1
    end

    def e
      rel 0, 1
    end

    def se
      rel 1, 1
    end

    def s
      rel 1, 0
    end

    def sw
      rel 1, -1
    end

    def w
      rel 0, -1
    end

    def nw
      rel -1, -1
    end

    def n2
      rel -2, 0
    end

    def ne2
      rel -2, 2
    end

    def e2
      rel 0, 2
    end

    def se2
      rel 2, 2
    end

    def s2
      rel 2, 0
    end

    def sw2
      rel 2, -2
    end

    def w2
      rel 0, -2
    end

    def nw2
      rel -2, -2
    end
  end
end
