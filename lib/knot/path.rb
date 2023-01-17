module Knot
  # Models an SVG path.
  #
  # https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths
  class Path
    def initialize
      @path = []
    end

    def M(m)
      @path.push __method__, m.x, m.y
    end

    def m(m)
      @path.push __method__, m.x, m.y
    end

    def L(m)
      @path.push __method__, m.x, m.y
    end

    def l(m)
      @path.push __method__, m.x, m.y
    end

    def A(rx, ry, x_axis_rotation, large_arc, sweep, m)
      @path.push __method__, rx, ry, x_axis_rotation, large_arc, sweep, m.x, m.y
    end

    def a(rx, ry, x_axis_rotation, large_arc, sweep, m)
      @path.push __method__, rx, ry, x_axis_rotation, large_arc, sweep, m.x, m.y
    end

    def z
      @path.push 'z'
      @path.join(' ')
    end
  end
end
