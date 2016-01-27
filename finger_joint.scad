/**
 * Generic finger joint module
 *
 * @param x Length of joint
 * @param y Height of joint (material thickness)
 * @param nx Number of fingers along length of joint (nx-2 when invert=true)
 * @param invert Inverts the joint (create section to fit into non-inverted version)
 */

module finger_joint(x, y, nx=10, invert=false)
{
	num_joints = nx - 2;
	dx = x / ((num_joints * 2) + 1);

	module fingers(start, end, offset_delta = 0)
	{
		for(i = [start : end])
		{
			translate([((dx * 2) * i) + offset_delta, 0])
			{
				square([dx, y]);
			}
		}
	}

	if(invert)
	{
		fingers(1, num_joints, -dx);
	}
	else
	{
		fingers(0, num_joints);
	}
}
