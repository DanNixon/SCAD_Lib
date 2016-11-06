include <../config.scad>

include <../common/hole.scad>

module A()
{
  difference()
  {
    square(DIMS, center=true);
    Hole();
  }
}

A();
