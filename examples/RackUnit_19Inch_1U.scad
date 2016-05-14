use <../BoltAndTabBox.scad>;

$fn = 16;

explode = 0;
side_explode = 0;

internal = [200, 425, 30]; // [depth, width, height]
material = [3.0, 0.1]; // [thickness, tolerance]
panel_padding = 5;

screws = [1.75, [-200, -75, 75, 200], [0]]; // [radius, [xy positions], [xz positions]]
holes = [[50, [-150, 0, 150]], [5, [-10, 10]]];

rack_panel = [1, 3, 5, 12.7]; // [units, hole radius, corner radius, offset]

config = [internal, material, panel_padding, screws, holes, rack_panel];

half_thick = material[0] / 2;
x = (internal[0] / 2) + half_thick + explode + side_explode;
y = (internal[1] / 2) + half_thick + explode;
z = (internal[2] / 2) + half_thick + explode;

color("red")
{
  translate([0, 0, z])
    XYPanel3D(config);

  translate([0, 0, -z])
    XYPanel3D(config);
}

color("green")
{
  rotate([90, 0, 0])
  {
    translate([0, 0, y])
      XZPanel3D(config);

    translate([0, 0, -y])
      XZPanel3D(config);
  }
}

color("blue")
{
  rotate([90, 0, 90])
  {
    translate([0, 0, x])
      Rack19InchPanel3D(config);

    translate([0, 0, -x])
      YZPanel3D(config);
  }
}
