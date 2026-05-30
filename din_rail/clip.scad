module DinRailClip() {
  translate([0, -14.1]) {
    union() {
      translate([0, 13]) {
        square([22, 4], center = true);
      }

      projection() {
        import("./DIN_Rail_Clip_Universal_opt5 v6.stl");
      }
    }
  }
}

linear_extrude(15) {
  DinRailClip();
}
