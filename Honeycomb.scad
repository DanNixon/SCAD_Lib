/* Honeycomb generator */
/* Modified from a generation I found online (to which I cannot find the
 * original link) */

module Honeycomb(size = [], grid = [], cell_size, wall_thickness, center = false)
{
  module HCGrid(grid_size)
  {
    echo (grid_size);

    delta = cell_size + wall_thickness;
    delta_x = (sqrt(3) / 2) * delta;

    function X(x) = x * delta_x;
    function Y(x, y) = (y * delta) + ((x % 2) * (delta / 2));

    center_offset = -[X(grid_size[0]), Y(grid_size[0], grid_size[1])] / 2;

    translate(center ? center_offset : [0, 0])
      for (i = [0 : grid_size[0]])
        for (j = [0 : grid_size[1]])
          translate([X(i), Y(i, j)])
            circle(r = cell_size * (sqrt(3)/3), $fn = 6);
  }

  echo (size, len(size));

  if(len(size) == 2)
  {
    rows = floor((1.2 * size[0]) / (cell_size + wall_thickness));
    cols = floor(size[1] / (cell_size + wall_thickness));
    HCGrid([rows, cols]);
  }
  else
  {
    HCGrid(grid);
  }
}
