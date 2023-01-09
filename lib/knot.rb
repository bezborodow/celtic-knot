require_relative "knot/grid"
require_relative "knot/cell"
require_relative "knot/point"
require_relative "knot/path"

module Knot
  class Error < StandardError; end

  def self.draw_mask(grid)
    d = Path.new
    grid.position 1, 1
    r = Point.distance(grid.w.o[:e], grid.n.o[:s]) / 2

    # Fill diamonds.
    odd = true
    (2..(grid.row_count-3)).each do |i|
      (2..(grid.column_count-3)).each do |j|
        next if odd = !odd
        grid.position i, j

        d.M grid.n.o[:s]
        d.L grid.e.o[:w]
        d.L grid.s.o[:n]
        d.L grid.w.o[:e]
      end
    end
    
    # NW Diamond.
    grid.position 1, 1
    d.M grid.e.o[:w]
    d.L grid.s.o[:n]
    d.L Point.midpoint(grid.s.o[:n], grid.w.o[:e])
    d.A r, r, 0, 0, 1, Point.midpoint(grid.n.o[:s], grid.e.o[:w])

    # N Diamonds.
    (3..(grid.column_count-4)).step(2) do |j|
      grid.position 1, j
      d.M grid.e.o[:w]
      d.L grid.s.o[:n]
      d.L grid.w.o[:e]
      d.L Point.midpoint(grid.w.o[:e], grid.n.o[:s])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.n.o[:s], grid.e.o[:w])
    end

    # NE Diamond.
    grid.position 1, grid.column_count-2
    d.M grid.s.o[:n]
    d.L grid.w.o[:e]
    d.L Point.midpoint(grid.n.o[:s], grid.w.o[:e])
    d.A r, r, 0, 0, 1, Point.midpoint(grid.s.o[:n], grid.e.o[:w])

    # E Diamonds.
    (3..(grid.row_count-4)).step(2) do |i|
      grid.position i, grid.column_count-2
      d.M grid.s.o[:n]
      d.L grid.w.o[:e]
      d.L grid.n.o[:s]
      d.L Point.midpoint(grid.e.o[:w], grid.n.o[:s])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.s.o[:n], grid.e.o[:w])
    end

    # SE Diamond.
    grid.position grid.row_count-2, grid.column_count-2
    d.M grid.w.o[:e]
    d.L grid.n.o[:s]
    d.L Point.midpoint(grid.n.o[:s], grid.e.o[:w])
    d.A r, r, 0, 0, 1, Point.midpoint(grid.s.o[:n], grid.w.o[:e])

    # S Diamonds.
    (grid.column_count-4).step(3, -2) do |j|
      grid.position grid.row_count-2, j
      d.M grid.w.o[:e]
      d.L grid.n.o[:s]
      d.L grid.e.o[:w]
      d.L Point.midpoint(grid.s.o[:n], grid.e.o[:w])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.s.o[:n], grid.w.o[:e])
    end

    # SW Diamond.
    grid.position grid.row_count-2, 1
    d.M grid.n.o[:s]
    d.L grid.e.o[:w]
    d.L Point.midpoint(grid.s.o[:n], grid.e.o[:w])
    d.A r, r, 0, 0, 1, Point.midpoint(grid.n.o[:s], grid.w.o[:e])

    # W Diamonds.
    (grid.row_count-4).step(3, -2) do |i|
      a = grid.position i, 1
      d.M grid.n.o[:s]
      d.L grid.e.o[:w]
      d.L grid.s.o[:n]
      d.L Point.midpoint(grid.s.o[:n], grid.w.o[:e])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.w.o[:e], grid.n.o[:s])
    end

    d.z
  end

  def self.draw_outline(grid)
    d = Path.new
    a = grid.position 1, 1
    r = Point.distance(a.o[:se], grid.nw.o[:nw]) / 2

    # NW Corner.
    a = grid.position 2, 1
    d.M a.o[:w]
    d.L Point.midpoint(a.o[:w], grid.nw.o[:s])
    d.A 1, 1, 0, 0, 1, Point.midpoint(grid.ne.o[:n], grid.n2.o[:e])

    # N Corners.
    (2..(grid.column_count-5)).step(2) do |j|
      a = grid.position 1, j
      d.L a.o[:n]
      d.L Point.midpoint(a.o[:n], grid.ne.o[:w])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.ne.o[:e], grid.e2.o[:n])
    end

    # NE Corner.
    a = grid.position 1, grid.column_count-3
    d.L a.o[:n]
    d.L Point.midpoint(a.o[:n], grid.ne.o[:w])
    d.A 1, 1, 0, 0, 1, Point.midpoint(grid.e2.o[:s], grid.se.o[:e])

    # E Corners.
    (2..(grid.row_count-5)).step(2) do |i|
      a = grid.position i, grid.column_count-2
      d.L a.o[:e]
      d.L Point.midpoint(a.o[:e], grid.se.o[:n])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.se.o[:s], grid.s2.o[:e])
    end

    # SE Corner.
    a = grid.position grid.row_count-3, grid.column_count-2
    d.L a.o[:e]
    d.L Point.midpoint(a.o[:e], grid.se.o[:n])
    d.A 1, 1, 0, 0, 1, Point.midpoint(grid.sw.o[:s], grid.s2.o[:w])

    # S Corners.
    (grid.column_count-3).step(4, -2) do |j|
      a = grid.position grid.row_count-2, j
      d.L a.o[:s]
      d.L Point.midpoint(a.o[:s], grid.sw.o[:e])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.sw.o[:w], grid.w2.o[:s])
    end

    # SW Corner.
    a = grid.position grid.row_count-2, 2
    d.L a.o[:s]
    d.L Point.midpoint(a.o[:s], grid.sw.o[:e])
    d.A 1, 1, 0, 0, 1, Point.midpoint(grid.nw.o[:w], grid.w2.o[:n])

    # W Corners.
    (grid.row_count-3).step(4, -2) do |i|
      a = grid.position i, 1
      d.L a.o[:w]
      d.L Point.midpoint(a.o[:w], grid.nw.o[:s])
      d.A r, r, 0, 0, 1, Point.midpoint(grid.nw.o[:n], grid.n2.o[:w])
    end

    d.z
  end

  def self.draw_knot(grid)
    d = Path.new
    a = grid.position 2, 2
    mp = Point.midpoint(a.i[:w], grid.nw.i[:s])
    sm_r = Point.distance(mp, grid.w.c)
    mp = Point.midpoint(grid.nw.i[:w], grid.w2.i[:n])
    b_r = Point.distance(mp, grid.w.c)

    # Diagonals right.
    (1..(grid.row_count-3)).step(2) do |i|
      (2..(grid.column_count-5)).step(2) do |j|
        a = grid.position i, j

        d.M a.o[:e_sw]
        d.L grid.se2.o[:n_sw]
        d.L grid.se2.o[:w_ne]
        d.L a.o[:s_ne]
      end
    end

    # Diagonals left.
    (4..(grid.row_count-2)).step(2) do |i|
      (1..(grid.column_count-4)).step(2) do |j|
        a = grid.position i, j

        d.M a.o[:e_nw]
        d.L grid.ne2.o[:s_nw]
        d.L grid.ne2.o[:w_se]
        d.L a.o[:n_se]
      end
    end

    # Bends N
    (4..(grid.column_count-3)).step(2) do |j|
      a = grid.position 1, j
      b = grid.rel 1, -3

      d.M a.o[:w_ne]
      d.L Point.midpoint(a.i[:w], grid.nw.i[:s])
      Point.distance(mp, grid.w.c)
      d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.w2.i[:e], grid.nw.i[:s])
      d.L b.o[:e_nw]
      d.L b.o[:n_se]
      d.L Point.midpoint(grid.nw.i[:w], grid.w2.i[:n])
      d.A b_r, b_r, 0, 0, 1, Point.midpoint(a.i[:n], grid.nw.i[:e])
      d.L a.o[:n_sw]
    end
    
    # Bend NE
    a = grid.position 2, grid.column_count-4
    b = grid.rel -1, 3

    d.M a.o[:n_se]
    d.L Point.midpoint(grid.ne.i[:n], grid.ne2.i[:w])
    d.A b_r, b_r, 0, 0, 1, Point.midpoint(grid.e2.i[:e], b.i[:s])
    d.L grid.e2.o[:e_nw]
    d.L grid.e2.o[:n_se]
    d.L Point.midpoint(grid.e2.i[:n], b.i[:w])
    d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.ne.i[:e], grid.ne2.i[:s])
    d.L a.o[:e_nw]

    # Bends E
    (1..(grid.row_count-6)).step(2) do |i|
      a = grid.position i, grid.column_count-3

      b = grid.rel 3, 1
      d.M a.o[:e_sw]
      d.L Point.midpoint(grid.se.i[:e], grid.se2.i[:n])
      d.A b_r, b_r, 0, 0, 1, Point.midpoint(grid.se2.i[:s], b.i[:e])
      d.L b.o[:e_nw]
      d.L b.o[:n_se]
      d.L Point.midpoint(grid.se2.i[:w], b.i[:n])
      d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.se.i[:s], grid.se2.i[:w])
      d.L a.o[:s_ne]
    end

    # Bend SE
    a = grid.position grid.row_count-2, grid.column_count-3
    d.M a.o[:e_sw]
    d.L Point.midpoint(a.i[:e], grid.se.i[:n])
    d.A 1, 1, 0, 0, 0, Point.midpoint(grid.ne.i[:s], grid.e2.i[:w])
    d.L grid.n2.o[:s_ne]
    d.L grid.n2.o[:e_sw]
    d.L Point.midpoint(grid.ne.i[:e], grid.e2.i[:n])
    d.A 1, 1, 0, 0, 1, Point.midpoint(a.i[:s], grid.se.i[:w])
    d.L a.o[:s_ne]

    # Bends S
    (2..(grid.column_count-5)).step(2) do |j|
      a = grid.position grid.row_count-2, j

      b = grid.rel -1, 3
      d.M a.o[:e_sw]
      d.L Point.midpoint(a.i[:e], grid.se.i[:n])
      d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.se.i[:n], grid.e2.i[:w])
      d.L b.o[:w_se]
      d.L b.o[:s_nw]
      d.L Point.midpoint(grid.se.i[:e], grid.e2.i[:s])
      d.A b_r, b_r, 0, 0, 1, Point.midpoint(a.i[:s], grid.se.i[:w])
      d.L a.o[:s_ne]
    end

    # Bend SW
    a = grid.position grid.row_count-3, 1
    d.M a.o[:s_nw]
    d.L Point.midpoint(a.i[:s], grid.sw.i[:e])
    d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.s2.i[:n], grid.se.i[:w])
    d.L grid.e2.o[:w_se]
    d.L grid.e2.o[:s_nw]
    d.L Point.midpoint(grid.s2.i[:e], grid.se.i[:s])
    d.A b_r, b_r, 0, 0, 1, Point.midpoint(a.i[:w], grid.sw.i[:n])
    d.L a.o[:w_se]

    # Bends W
    (2..(grid.row_count-5)).step(2) do |i|
      a = grid.position i, 1
      b = grid.rel 3, 1

      d.M a.o[:s_nw]
      d.L Point.midpoint(a.i[:s], grid.sw.i[:e])
      d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.sw.i[:e], grid.s2.i[:n])
      d.L b.o[:n_sw]
      d.L b.o[:w_ne]
      d.L Point.midpoint(grid.sw.i[:s], grid.s2.i[:w])
      d.A b_r, b_r, 0, 0, 1, Point.midpoint(a.i[:w], grid.sw.i[:n])
      d.L a.o[:w_se]
    end

    # Bend NW
    a = grid.position 1, 2
    d.M a.o[:w_ne]
    d.L Point.midpoint(a.i[:w], grid.nw.i[:s])
    d.A sm_r, sm_r, 0, 0, 0, Point.midpoint(grid.w2.i[:e], grid.sw.i[:n])
    d.L grid.s2.o[:n_sw]
    d.L grid.s2.o[:w_ne]
    d.L Point.midpoint(grid.w2.i[:s], grid.sw.i[:w])
    d.A b_r, b_r, 0, 0, 1, Point.midpoint(a.i[:n], grid.nw.i[:e])
    d.L a.o[:n_sw]

    d.z
  end
end
