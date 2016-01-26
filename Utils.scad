module Matrix2D(x_len, y_len, x_step, y_step)
{
  for(y = [0 : y_len-1])
    translate([0, y*y_step])
      for(x = [0 : x_len-1])
        translate([x*x_step, 0])
          children();
}

module Matrix3D(x_len, y_len, z_len, x_step, y_step, z_step)
{
  for(z = [0 : z_len-1])
    translate([0, 0, z*z_step])
      Matrix2D(x_len, y_len, x_step, y_step)
        children();
}
