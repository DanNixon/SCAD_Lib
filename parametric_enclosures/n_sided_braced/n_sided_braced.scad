include <CAD-Library/living_hinge/HingeMain.scad>
include <config.scad>

function get_used_circ(panel_angle, circle_radius) =
	((2 * PI * circle_radius) / 360) * (2 * (90 - (panel_angle / 2)));

function get_corner_offset_angle(num_faces) =
	360 / num_faces;

function get_end_panel_radius(panel_length, num_faces) =
	(panel_length * sin((180 - get_corner_offset_angle(num_faces)) / 2))
	/ sin(get_corner_offset_angle(num_faces));

module LHnSidedBracedBox_EndPanel(panel_length, num_faces, circle_radius)
{
	corner_angle = 360 / num_faces;
	centre_offset = get_end_panel_radius(panel_length, num_faces);

	hull()
	{
		for(i = [0 : corner_angle : 359])
		{
			rotate(i)
				translate([centre_offset, 0])
					circle(r=circle_radius);
		}
	}
}
