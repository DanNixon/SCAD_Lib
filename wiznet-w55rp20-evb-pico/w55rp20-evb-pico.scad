z_offset = 4.5;

module W55RP20EVBPico_device() {
  translate([21 / 2, 0, z_offset]) {
    rotate([0, 0, 90]) {
      import("model.stl");
    }
  }
}

module W55RP20EVBPico_add() {
  // Mouting hole supports
  for (x = [-7, 7]) {
    translate([x, 78, 0]) {
        cylinder(h = z_offset - 1.6, d1 = 5.5, d2 = 3.2, $fn = 32);
    }
  }
}

module W55RP20EVBPico_subtract(hole_extra_depth = 0) {
  // Mouting hole cutouts
  for (x = [-7, 7]) {
    translate([x, 78, -hole_extra_depth]) {
      cylinder(h = z_offset + hole_extra_depth, d = 2.1, $fn = 6);
    }
  }

  // RJ45 panel cutout
  translate([0, -6 / 2, 11]) {
    cube([17, 6, 15], center=true);
  }
}

color("grey", 0.5) {
  W55RP20EVBPico_device();
}
difference() {
  color("green") {
    W55RP20EVBPico_add();
  }
  #W55RP20EVBPico_remove(hole_extra_depth = 1);
}
