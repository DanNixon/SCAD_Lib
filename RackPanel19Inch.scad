use <Suwako/Utils.scad>;

module RackPanel19Inch(u=1, offset=12.7, hole_r=3, corner_r=5)
{
  // TODO: Check holes[0]
  holes = [470, 31.75 * u];
  plate = [482.6 - (corner_r * 2),
           holes[1] + offset - (corner_r * 2)];

  difference()
  {
    // Outer
    translate(-plate/2)
      hull()
        Matrix2D(2, 2, plate[0], plate[1])
          circle(r=corner_r);

    // Mounting holes
    translate(-holes/2)
      Matrix2D(2, 2, holes[0], holes[1])
        circle(r=hole_r);
  }
}