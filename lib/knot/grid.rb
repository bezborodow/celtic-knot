require 'matrix'

module Knot
  # The grid is a Matrix of cells (arranged as rows and columns.)
  #
  # https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Matrix.html
  class Grid < Matrix
    attr_reader :position

    # The grid can be navigated with absolute coordinates i, j.
    def position i, j
      @position = Vector[i, j]
      self[*@position]
    end

    # Nearby cells accessed relatively with i, j.
    def rel i, j
      self[*@position + Vector[i, j]]
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
