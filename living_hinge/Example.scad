include <HingeMain.scad>

LivingHinge(50, 20, dx=1, gap=GAP_DIAMOND);

translate([0, 20])
	LivingHinge(50, 20, dx=1);
