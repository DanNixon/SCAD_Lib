z_offset = 9.2;

module SDP8xx_device() {
  translate([0, 0, z_offset]) {
    import("model.stl");
  }
}

module SDP8xx_subtract(hole_extra_depth = 0) {
  // Mouting hole cutouts
  for (x = [-12, 12]) {
    translate([x, 4, -hole_extra_depth]) {
      cylinder(h = 0.2 + hole_extra_depth, d = 3, $fn = 7);
    }
  }

  // Ports panel cutout
  translate([0, -6 / 2, 13.75]) {
    cube([24, 6, 12], center=true);
  }
}

color("grey", 0.5) {
  SDP8xx_device();
}
#SDP8xx_subtract(hole_extra_depth = 1);
