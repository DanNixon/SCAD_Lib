module CircleSliceLinear2D(radius, width)
{
  intersection()
  {
    circle(r = radius);

    hull()
    {
      translate([radius, 0, 0])
      {
        translate([0, width/2])
          circle(r=0.01);
        translate([0, -width/2])
          circle(r=0.01);
      }
      circle(r = width/2);
    }
  }
}

module CircleSliceAngular2D(radius, angle)
{
  intersection()
  {
    circle(r = radius);

    hull()
    {
      translate([radius, 0, 0])
        circle(r=0.01);

      rotate([0, 0, angle])
        translate([radius, 0, 0])
          circle(r=0.01);

      circle(r=0.01);
    }
  }
}
