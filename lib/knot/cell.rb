require_relative "point"

module Knot
  # Each cell within the grid contains several cartesian points stored in hashes.
  # These points are precaclulated so that minimal calculations are required when pathing.
  class Cell
    attr_reader :c, :i, :o

    def initialize(c, inner, stroke)
      outer = inner + stroke

      @c = c

      pos = {
        n: [0, -1], ne: [0.5, -0.5], e: [1, 0], se: [0.5, 0.5],
        s: [0, 1], sw: [-0.5, 0.5], w: [-1, 0], nw: [-0.5, -0.5]
      }

      @i = pos.each_with_object({}) do |(k, v), a|
        a[k] = Point[c.x + v[0] * inner,
                     c.y + v[1] * inner]
      end

      @o = pos.each_with_object({}) do |(k, v), a|
        a[k] = Point[c.x + v[0] * outer,
                     c.y + v[1] * outer]
      end

      subpos = [
        [:n, :sw], [:n, :se],
        [:e, :sw], [:e, :nw],
        [:s, :nw], [:s, :ne],
        [:w, :ne], [:w, :se],
      ]
      subpos.each do |v|
        sym = (v[0].to_s << '_' << v[1].to_s).to_sym
        @o[sym] = Point[@o[v[0]].x + stroke * pos[v[1]][0],
                        @o[v[0]].y + stroke * pos[v[1]][1]]
      end
    end
  end
end
