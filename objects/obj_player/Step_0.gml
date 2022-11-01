/// @description Insert description here
// You can write your code in this editor

//Horizontal movement direction
hSpeed = (press_right - press_left) * walkSpeed;
if (hSpeed != 0) 
{
	image_xscale = -(press_right - press_left);
}
//Increase falling speed with time
vSpeed += grav;

if (hSpeed != 0) && (vSpeed != 0)
{
	image_index = 1
}

//Is jumping possible? (With forgiveness frames)
if (canJump-- > 0) && (press_jump) && (isDashing = 0)
{
	vSpeed = jumpSpeed;
	canJump = 0;
}
else if (canJump <= 0) && (press_jump) && (canDJump > 0) && (isDashing = 0)
{
	vSpeed = jumpSpeed;
	canDJump = 0;
}

//Jump lower if jump is released early
if (keyboard_check_released(release_jump)) && (vSpeed < 0) vSpeed = 0.1 * jumpSpeed;

//Horizontal collision check and movement
if (place_meeting(x + hSpeed, y, obj_wall))
{
	var nearestWall = instance_nearest(x,y,obj_wall)
	if nearestWall.image_index = 0
	{
		while (abs(hSpeed) > 0.1)
		{
			hSpeed *= 0.5;
			if (!place_meeting(x + hSpeed, y, obj_obstacle)) x += hSpeed;
		}
		hSpeed = 0;
	}
}
x += hSpeed;

//Vertical collision check and movement
if (place_meeting(x, y + vSpeed, obj_obstacle))
{
	var nearestWall = instance_nearest(x,y,obj_obstacle)
	if nearestWall.image_index = 0
		{
		if (vSpeed > 0) canJump = 4;
		while (abs(vSpeed) > 0.1)
		{
			vSpeed *= 0.5;
			canDJump = 1
			canDash = 1
			if (!place_meeting(x, y + vSpeed, obj_obstacle)) y += vSpeed;
		}
		vSpeed = 0;
	}
}
y += vSpeed;