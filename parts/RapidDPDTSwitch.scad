module RapidDPDTSwitch()
{
  square([4, 9], center=true);

  translate([0, 9.5])
    circle(d=2);

  translate([0, -9.5])
    circle(d=2);
}
