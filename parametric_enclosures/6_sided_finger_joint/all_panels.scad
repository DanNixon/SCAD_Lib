include <box_main.scad>

//Top panel
translate([0, (height + all_panel_offset)])
	top_bottom();

//Font panel
front_back();

//Left panel
translate([-(depth + all_panel_offset), 0])
	left_right();

//Right panel
translate([(width + all_panel_offset), 0])
	left_right();

//Bottom panel
translate([0, -(depth + all_panel_offset)])
	top_bottom();

//Back panel
translate([0, -(depth + height + (2 * all_panel_offset))])
	front_back();
