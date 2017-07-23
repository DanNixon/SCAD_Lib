use <SCAD_Lib/Shapes.scad>;

function PineA64BoardDimensions() = [127, 79];
function PineA64MountCentres() = [118, 70];
function PineA64MountDiameter() = 3;

module PineA64PlaceMountingHoles()
{
  p = PineA64MountCentres() / 2;
  for(x = [-p[0], p[0]])
    for(y = [-p[1], p[1]])
      translate([x, y])
        children();
}

module PineA64()
{
  difference()
  {
    square(PineA64BoardDimensions(), center=true);

    PineA64PlaceMountingHoles()
      circle(d=PineA64MountDiameter(), $fn=16);
  }
}
