/*
 * Rectangular gaps
 *
 * Generic Living Hinges
 * Dan Nixon, dan-nixon.com
 * 29/06/2014
 */

module LH_Gap_Rectangle(x, width, step)
{
	x2 = (width / 2);
  translate([x, 0.1])
    square([width, 0.2], center=true);
}
