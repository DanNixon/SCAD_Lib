/*
 * Diamond shaped gaps
 *
 * Generic Living Hinges
 * Dan Nixon, dan-nixon.com
 * 29/06/2014
 */

module LH_Gap_Diamond(x, width, step)
{
	x2 = (width / 2);
	polygon([[x-x2,0],[x,0.1],[x+x2,0],[x-x2,-0.1]], [[0,1,2,3]]);
}
