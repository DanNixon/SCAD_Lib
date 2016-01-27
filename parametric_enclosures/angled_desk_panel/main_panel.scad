include <angled_desk_panel.scad>

hinge_A_length = get_used_circ(panel_angle, circle_radius) + circle_radius;
hinge_B_length = get_used_circ((90-panel_angle), circle_radius) + circle_radius;
dx = get_dx(panel_length, panel_angle);
dy = get_dy(panel_length, panel_angle);

width = panel_width + (2 * material_thickness);

square([width, dx]);

translate([0, dx])
	LivingHinge(width, hinge_A_length, num_hinge_slots, dx=hinge_sep_x, dy=hinge_sep_y, gap=hinge_gap_type);

translate([0, (dx + hinge_A_length)])
	square([width, panel_length]);

translate([0, (dx + hinge_A_length + panel_length)])
	LivingHinge(width, hinge_B_length, num_hinge_slots, dx=hinge_sep_x, dy=hinge_sep_y, gap=hinge_gap_type);

translate([0, (dx + hinge_A_length + panel_length + hinge_B_length)])
	square([width, dy]);
