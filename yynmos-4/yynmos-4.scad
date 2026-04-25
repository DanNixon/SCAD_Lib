z_offset = 3.5;

mounting_hole_positions = [
  [-(50 / 2) + 4, (56 / 2) - 4.5],
  [-(50 / 2) + 4 + 32.8, (56 / 2) - 4.5],
];
support_positions = [
  [-(50 / 2) + 4, (56 / 2) - 4.5],
  [-(50 / 2) + 4 + 32.8, (56 / 2) - 4.5],
  [0, -15],
];

module YYNMOS4_device() {
  translate([0, 0, (1.6 / 2) + z_offset]) {
    difference() {
      cube([50, 56, 1.6], center = true);

      // Mounting holes
      for (pos = mounting_hole_positions) {
        translate([pos[0], pos[1], 0]) {
          cylinder(h = 1.7, d = 3, $fn = 32, center = true);
        }
      }
    }
  }
}

module YYNMOS4_add() {
  // Mouting hole supports
  for (pos = support_positions) {
    translate([pos[0], pos[1]]) {
      cylinder(h = z_offset, d1 = 12, d2 = 8, $fn = 32);
    }
  }
}

module YYNMOS4_subtract(hole_extra_depth = 0) {
  // Mouting hole cutouts
  for (pos = mounting_hole_positions) {
    translate([pos[0], pos[1], -hole_extra_depth]) {
      cylinder(h = 1.6 + 3.5 + hole_extra_depth, d = 3, $fn = 6);
    }
  }
}

color("grey", 0.5) {
  YYNMOS4_device();
}
difference() {
  color("green") {
    YYNMOS4_add();
  }
  #YYNMOS4_subtract(hole_extra_depth = 1);
}
