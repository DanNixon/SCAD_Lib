use <../BubblescopeMount.scad>;

BubblescopeMount(threads=true);

translate([30, 0, 0])
  BubblescopeMount(threads=false);
