class_name Enemy
extends CharacterBody3D

@onready var area_3d = $Area3D
@onready var ai_movement = $Scripts/AIMovement
@export var is_aggroed: bool = false

@export var health: int = 100
@export var max_health: int = 100


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

func take_damage(damage):
	health -= damage
	print(str(name," has taken ", damage, " damage"))
	if(health <= 0):
		die()
		pass
	pass
	
func die():
	print(str(name, " has died"))
	queue_free()
	pass
