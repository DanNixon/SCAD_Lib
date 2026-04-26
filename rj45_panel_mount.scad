// Suitable for this style of panel mount cable: https://www.aliexpress.com/item/1005009333644737.html

module Rj45Connector() {
  // Connector
  square([15.9, 13.2], center = true);

  // Connector mounting holes
  dx = 28 / 2;
  for(x = [-dx, dx]) {
    translate([x, 1.5]) {
      circle(d = 3.1, $fn = 16);
    }
  }
}

difference() {
  square([50, 50], center = true);
  Rj45Connector();
}
