use <../Label.scad>;

difference()
{
  square([80, 70]);

  translate([15, 20])
    Label("a hole")
      circle(d=5, center=true);

  translate([15, 40])
    Label("a hole", size=2, offset=[0, -4])
      circle(d=5, center=true);

  translate([15, 60])
    Label("a hole", size=2, offset=[8, 0], valign="left")
      circle(d=5, center=true);

  translate([40, 20])
    Label("a hole", size=2, offset=[5, -5], valign="left", angle=45)
      circle(d=5, center=true);
}
