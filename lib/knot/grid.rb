require 'matrix'

module Knot
  # The grid is a [`Matrix`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Matrix.html)
  # of cells (arranged as rows and columns.) The grid can be nagivated with absolute
  # coordinates using the `position(i, j)` method and nearby cells accessed relatively
  # using the `rel(i, j)` method.
  class Grid < Matrix
    attr_reader :position

    def position i, j
      @position = Vector[i, j]
      self[*@position]
    end

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
