include <n_sided_braced.scad>

difference()
{
	LHnSidedBracedBox_EndPanel(face_length, num_faces, (circle_radius + material_thickness + outer_padding));
	difference()
	{
		LHnSidedBracedBox_EndPanel(face_length, num_faces, (circle_radius + material_thickness));
		LHnSidedBracedBox_EndPanel(face_length, num_faces, circle_radius);
	}
}
