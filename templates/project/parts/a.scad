include <../config.scad>

use <../common/hole.scad>

module A()
{
  difference()
  {
    square(DIMS, center=true);
    Hole();
  }
}

A();
