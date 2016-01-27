module Label(t, size=5, offset=[0, -10], angle=0, valign="center")
{
  children();

  translate(offset)
    rotate([0, 0, angle])
      text(t, size, halign="center", valign=valign);
}
