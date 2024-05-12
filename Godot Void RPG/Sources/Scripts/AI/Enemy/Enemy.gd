class_name Enemy
extends CharacterBody3D

@onready var area_3d = $Area3D
@onready var ai_movement = $Scripts/AIMovement
@export var is_aggroed: bool = false

func _on_area_3d_body_entered(body):
	if(body.name == "PlayerBody"):
		print(str(name, " was aggroed by Player"))
		is_aggroed = true
		pass
	pass

func _on_area_3d_body_exited(body):
	if(body.name == "PlayerBody"):
		
		
		pass
	pass
