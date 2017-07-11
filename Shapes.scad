module RoundedRectangle(size, r=1, center=false)
{
  d = r * 2;
  minkowski()
  {
    square(size - [d, d], center=center);
    circle(r=r);
  }
}
