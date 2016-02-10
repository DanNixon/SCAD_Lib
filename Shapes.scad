module RoundedRectangle(size, r=1, center=false)
{
  d = r * 2;
  minkowski()
  {
    circle(r=r);
    square([size[0]-d, size[1]-d], center=center);
  }
}
