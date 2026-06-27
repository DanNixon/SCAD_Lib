module DinRailClip() {
  translate([0, -14.1]) {
    difference() {
      union() {
        translate([0, 13]) {
          square([22, 4], center = true);
        }

        projection() {
          import("./DIN_Rail_Clip_Universal_opt5 v6.stl");
        }
      }

      translate([8, 3]) {
        square([9, 7], center = true);
      }
    }
  }
}

linear_extrude(15) {
  DinRailClip();
}
