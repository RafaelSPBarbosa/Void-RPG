extends Node3D

@onready var player_body = $"../PlayerBody"

func _process(delta):
	if(Input.is_action_pressed("RMB")):
		rotate(Vector3(0,1,0), -Input.get_last_mouse_velocity().x / 10000)
		
	position = player_body.position;
	pass
