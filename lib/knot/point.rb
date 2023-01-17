require 'matrix'

module Knot
  # Each point is modelled in the cartesian plane as a
  # [`Vector[x, y]`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Vector.html).
  class Point < Vector
    def x
      self[0]
    end

    def y
      self[1]
    end

    # Calculates the midpoint between two points. Used where a desired point has not
    # been precalculated but can instead be derived from another pair of points that
    # *are* precalculated.
    def self.midpoint(a, b)
      (a + b) / 2
    end

    # Calculates the distance between two points. Used for calculating radii for arc
    # curves.
    def self.distance(a, b)
      (a - b).magnitude
    end
  end
end
