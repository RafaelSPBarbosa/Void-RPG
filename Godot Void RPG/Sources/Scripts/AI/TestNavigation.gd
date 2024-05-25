extends Node3D

@onready var nav = $NavigationAgent3D

func _physics_process(delta):
	var pos = get_node("/root/Main/Player").player_body.global_position
	print(nav.get_next_path_position().y)
	nav.set_target_position(pos)
	global_position = nav.get_next_path_position()
	pass
