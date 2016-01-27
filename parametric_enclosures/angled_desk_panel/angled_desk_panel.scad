include <CAD-Library/living_hinge/HingeMain.scad>
include <config.scad>

function get_dx(panel_length, panel_angle) =
	(panel_length / sin(90)) * sin(180-90-panel_angle);

function get_dy(panel_length, panel_angle) =
	(panel_length / sin(90)) * sin(panel_angle);

function get_used_circ(panel_angle, circle_radius) =
	((2 * PI * circle_radius) / 360) * (2 * (90 - (panel_angle / 2)));

module LHAngleEnclosure_EndPanel(panel_length, panel_angle, circle_radius)
{
	x = get_dx(panel_length, panel_angle);
	y = get_dy(panel_length, panel_angle);

	hull()
	{
		circle(r=circle_radius);

		translate([x, y])
			circle(r=circle_radius);

		translate([(x + circle_radius), -circle_radius])
			circle(r=0.01);
	}
}
