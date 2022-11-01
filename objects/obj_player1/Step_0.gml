/// @description Insert description here
// You can write your code in this editor

var press_left = keyboard_check_pressed(vk_left);
var press_jump = keyboard_check_pressed(vk_up);
var release_jump = keyboard_check_released(vk_up);
var press_dive = keyboard_check_pressed(vk_down);

#region //MOVEMENT & COLLISION
//Horizontal movement
if hSpeed < hSpeedMax
{
	hSpeed += hSpeedAcceleration
}
else hSpeed = hSpeedMax

//Increase falling speed with time
vSpeed += grav;


//Is jumping possible? (With forgiveness frames)
if (canJump-- > 0) && (press_jump)
{
	vSpeed = jumpSpeed;
	canJump = 0;
	isDiving = 0
}
else if (canJump <= 0) && (press_jump) && (canDJump > 0)
{
	vSpeed = jumpSpeed;
	canDJump = 0;
	isDiving = 0
}

//Jump lower if jump is released early
if (release_jump) && (vSpeed < 0) vSpeed = 0.1 * jumpSpeed;

//Horizontal collision check and movement
if (place_meeting(x + hSpeed, y, obj_wall))
{
	var nearestWall = instance_nearest(x,y,obj_wall)
	
	hSpeed = -hSpeed/2;
	instance_destroy(nearestWall)

}
x += hSpeed;

//Vertical collision check, movement, diving
if press_dive = true isDiving = 1

if isDiving = 1 vSpeed = divingSpeed

if (place_meeting(x, y + vSpeed, obj_obstacle))
{
	var nearestWall = instance_nearest(x,y,obj_obstacle)
		if (vSpeed > 0) canJump = 3;
		while (abs(vSpeed) > 0.1)
		{
			vSpeed *= 0.5;
			canDJump = 1
			canDash = 1
			isDiving = 0
			if (!place_meeting(x, y + vSpeed, obj_obstacle)) y += vSpeed;
		}
		vSpeed = 0;

}
y += vSpeed;
#endregion

if place_meeting(x,y,obj_portal)
{
	x = 0
	lap++
}

if (lap < obj_player2.lap) && (obstacleCurrentCooldown <= 0)
{
	if press_left 
	{
		instance_create_depth(x-100,y,0,obj_wall)
		obstacleCurrentCooldown = obstacleCooldown
	}
}
else if (lap = obj_player2.lap) && (x < obj_player2.x) && (obstacleCurrentCooldown <= 0)
{
	if press_left 
	{
		instance_create_depth(x-100,y,0,obj_wall)
		obstacleCurrentCooldown = obstacleCooldown
	}
}
obstacleCurrentCooldown--