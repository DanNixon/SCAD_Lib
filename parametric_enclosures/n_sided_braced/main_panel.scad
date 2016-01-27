include <n_sided_braced.scad>

hinge_len = get_used_circ((180 - get_corner_offset_angle(num_faces)), circle_radius);
y_trans_coeff = ((face_length + hinge_len));
y_trans_const = (face_length / 2) + hinge_len;

square([box_width, (face_length / 2)]);
translate([0, (face_length / 2)])
			LivingHinge(box_width, hinge_len, num_hinge_slots, dx=hinge_sep_x, dy=hinge_sep_y, gap=hinge_gap_type);

for(i = [2 : num_faces])
{
	assign(y = ((i - 2) * y_trans_coeff) + y_trans_const)
	{
		translate([0, y])
			square([box_width, face_length]);

		translate([0, (y + face_length)])
			LivingHinge(box_width, hinge_len, num_hinge_slots, dx=hinge_sep_x, dy=hinge_sep_y, gap=hinge_gap_type);
	}
}

translate([0, (((num_faces - 1) * y_trans_coeff) + y_trans_const)])
	square([box_width, (face_length / 2)]);
