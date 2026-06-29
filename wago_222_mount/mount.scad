module _Mount(model_file, model_offset, size) {
  translate([-size[0] / 2, -size[1] / 2, -1]) {
    intersection() {
      translate(model_offset) {
        rotate([90, 0, 0]) {
          import(model_file);
        }
      }

      cube(size);
    }
  }
}

module Wago222Mount_2pin() {
  _Mount("./wago holder 2-pin.stl", [0, 0], [16.75, 17, 18]);
}

module Wago222Mount_3pin() {
  _Mount("./wago holder 3-pin.stl", [-341.25, 0], [21.5, 17, 18]);
}

module Wago222Mount_5pin() {
  _Mount("./wago holder 5-pin.stl", [-259.8, 0], [31.4, 17, 18]);
}

Wago222Mount_2pin();
translate([0, 25, 0])
  Wago222Mount_3pin();
translate([0, 50, 0])
  Wago222Mount_5pin();
