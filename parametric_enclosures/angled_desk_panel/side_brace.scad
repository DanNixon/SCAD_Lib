include <angled_desk_panel.scad>

difference()
{
	LHAngleEnclosure_EndPanel(panel_length, panel_angle, (circle_radius + material_thickness + outer_padding));
	difference()
	{
		LHAngleEnclosure_EndPanel(panel_length, panel_angle, (circle_radius + material_thickness));
		LHAngleEnclosure_EndPanel(panel_length, panel_angle, circle_radius);
	}
}
