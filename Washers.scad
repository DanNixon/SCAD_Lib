use <Utils.scad>

module Washer2D(inner, outer)
{
  difference()
  {
    circle(d=outer);
    circle(d=inner);
  }
}

module Washer3D(inner, outer, h)
{
  difference()
  {
    cylinder(d=outer, h=h);
    translate([0, 0, -0.1])
      cylinder(d=inner, h=(h + 0.2));
  }
}

module Washer(inner=1, outer=2, h=0)
{
  if (h == 0)
    Washer2D(inner, outer);
  else
    Washer3D(inner, outer, h);
}

module WasherMatrix(rows, cols, inner, outer, h=0, sep=0.5)
{
  offset = outer + sep;
  Matrix2D(rows, cols, offset, offset)
    Washer(inner, outer, h);
}
