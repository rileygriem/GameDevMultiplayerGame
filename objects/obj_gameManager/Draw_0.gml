/// @description Insert description here
// You can write your code in this editor

if obj_player1.lap = 10
{
	draw_text(view_camera[0].x, view_camera[0].y, "Blue Player Wins!")
	draw_text(view_camera[1].x, view_camera[1].y, "Blue Player Wins!")
	obj_player2.lap = 0
}

if obj_player2.lap = 10
{
	draw_text(view_camera[0].x, view_camera[0].y, "Green Player Wins!")
	draw_text(view_camera[1].x, view_camera[1].y, "Green Player Wins!")
	obj_player1.lap = 0
}

draw_text(camera_get_view_x(view_camera[0])+10, camera_get_view_y(view_camera[0])+10, "Laps: " + string(obj_player1.lap))
draw_text(camera_get_view_x(view_camera[1])+10, camera_get_view_y(view_camera[1])+10, "Laps: " + string(obj_player2.lap))