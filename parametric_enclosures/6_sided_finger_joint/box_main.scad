include <CAD-Library/finger_joint.scad>

include <config.scad>

module generic_side(x, y, invert)
{
	square([x, y]);

	//Top finger joint
	translate([0, y])
		finger_joint(x, material_thickness, num_fingers, !invert);

	//Bottom finger joint
	translate([0, -material_thickness])
		finger_joint(x, material_thickness, num_fingers, !invert);

	//Left finger joint
	rotate(90)
		translate([0, 0])
			finger_joint(y, material_thickness, num_fingers, invert);

	//Right finger joint
	rotate(90)
		translate([0, -(x + material_thickness)])
			finger_joint(y, material_thickness, num_fingers, invert);
}

module front_back()
{
	generic_side(width, height, false);
}

module left_right()
{
	generic_side(depth, height, true);
}

module top_bottom()
{
	generic_side(width, depth, true);
}
