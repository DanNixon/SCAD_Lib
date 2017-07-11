use <SCAD_Lib/Shapes.scad>;

function RaspberryPiZeroBoardDimensions() = [65, 30];
function RaspberryPiZeroBoardCornerRadius() = 3;
function RaspberryPiZeroMountCentres() = [58, 23];
function RaspberryPiZeroMountDiameter() = 2.75;

module RaspberryPiZeroPlaceMountingHoles()
{
  p = RaspberryPiZeroMountCentres() / 2;
  for(x = [-p[0], p[0]])
    for(y = [-p[1], p[1]])
      translate([x, y])
        children();
}

module RaspberryPiZero()
{
  difference()
  {
    RoundedRectangle(RaspberryPiZeroBoardDimensions(), r=RaspberryPiZeroBoardCornerRadius(), center=true, $fn=32);

    RaspberryPiZeroPlaceMountingHoles()
      circle(d=RaspberryPiZeroMountDiameter(), $fn=16);
  }
}
