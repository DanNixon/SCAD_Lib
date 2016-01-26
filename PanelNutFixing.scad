module PanelNutFixing(width, length, nut_thickness, nut_width, nut_dist=0, thickness=0)
{
  nut_dist = nut_dist == 0 ? length - nut_thickness : nut_dist;

  translate([0, length/2, 0])
	{
		if(thickness == 0)
			square([width, length], center=true);
		else
			cube([width, length, thickness], center=true);
	}

  translate([0, nut_dist+(nut_thickness/2), 0])
	{
		if(thickness == 0)
			square([nut_width, nut_thickness], center=true);
		else
			cube([nut_width, nut_thickness, thickness], center=true);
	}
}

module PanelNutFixing_M3(thickness=0)
{
  /* Dimensions taken from M3_ScrewJoint.dxf */
  PanelNutFixing(
    width=3.5,
    length=10,
    nut_thickness=2.5,
    nut_width=6,
    nut_dist=5.5,
    thickness=thickness);
}
