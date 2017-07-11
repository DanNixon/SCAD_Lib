function RaspberryPiZeroBoardDimensions() = [65, 30];
function RaspberryPiZeroMountCentres() = [58, 23];
function RaspberryPiZeroMountDiemeter() = 2.75;

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
  corner_radius = 3;

  difference()
  {
    minkowski()
    {
      square(RaspberryPiZeroBoardDimensions() - ([corner_radius, corner_radius] * 2), center=true);
      circle(r=corner_radius, $fn=32);
    }

    RaspberryPiZeroPlaceMountingHoles()
      circle(d=RaspberryPiZeroMountDiemeter(), $fn=16);
  }
}
