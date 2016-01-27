/*
 * Gap module selector
 *
 * Generic Living Hinges
 * Dan Nixon, dan-nixon.com
 * 30/06/2014
 *
 */

use <Gap_Diamond.scad>
use <Gap_Rectangle.scad>

GAP_DIAMOND 			= 1;
GAP_RECTABGLE 		= 2;

module LH_Gap(x, width, step, gap)
{
	if(gap == GAP_DIAMOND) LH_Gap_Diamond(x, width, step);
	if(gap == GAP_RECTANGLE) LH_Gap_Rectangle(x, width, step);
}
