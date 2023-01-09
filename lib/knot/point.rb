require 'matrix'

module Knot
  class Point < Vector
    def x
      self[0]
    end

    def y
      self[1]
    end

    def self.midpoint(a, b)
      (a + b) / 2
    end

    def self.distance(a, b)
      (a - b).magnitude
    end
  end
end
