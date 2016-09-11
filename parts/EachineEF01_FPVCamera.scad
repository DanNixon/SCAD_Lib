module EachineEF01_FPVCamera()
{
  body_dims = [18, 20, 12];
  half_dims = body_dims / 2;

  screw_centres = 25;
  screw_z_offset = 2;

  translate([0, 0, -screw_z_offset])
  {
    translate([0, 0, body_dims[2] / 2])
      color("grey")
        cube(body_dims, center=true);

    translate([0, 0, body_dims[2]])
      color("darkgrey")
        cylinder(d=10, h=12, $fn=64);

    translate([body_dims[0] / 2, 0, 4])
    {
      pcb_height = 2;

      color("green")
        cube([pcb_height * 2, 4, 3], center=true);

      translate([pcb_height, 0, 0])
      {
        coax_length = 15;

        rotate([0, 90, 0])
          color("tan")
            cylinder(d=2, h=coax_length, $fn=32);

        translate([coax_length, 0, 0])
        {
          color("orange")
          {
            cloverleaf_diam = 22;

            intersection()
            {
              sphere(d=cloverleaf_diam, $fn=64);
              translate([cloverleaf_diam / 2, 0, 0])
                cube([cloverleaf_diam, cloverleaf_diam, cloverleaf_diam], center=true);
            }
          }
        }
      }
    }

    color("green")
      hull()
        for(y = [-screw_centres / 2, screw_centres / 2])
          translate([0, y, screw_z_offset])
            cylinder(d=5, h=2, $fn=32);

    color("darkgrey")
      for(y = [-screw_centres / 2, screw_centres / 2])
        translate([0, y, screw_z_offset - 1])
          cylinder(d=3, h=6, $fn=32);
  }
}

EachineEF01_FPVCamera();
