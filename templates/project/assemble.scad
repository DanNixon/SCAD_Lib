include <config.scad>

use <parts/a.scad>

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=MATERIAL_THICKNESS, center=true)
      children();
}

A();
