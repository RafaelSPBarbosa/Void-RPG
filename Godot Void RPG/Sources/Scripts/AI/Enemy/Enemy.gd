class_name Enemy
extends CharacterBody3D

@onready var area_3d = $Area3D
@onready var ai_movement = $Scripts/AIMovement
@export var is_aggroed: bool = false

@export var health: int = 100
@export var max_health: int = 100

@export var damage: int = 5
@export var time_between_attacks: float = 3
var time_since_last_attack = 0

func _physics_process(delta):
	time_since_last_attack += delta
	if(time_since_last_attack >= time_between_attacks):
		time_since_last_attack = 0
		get_node("/root/Main/Player").take_damage(damage)
		pass
	pass

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
	
func stop_attacking():
	
	pass
	
func start_attacking():
	time_since_last_attack = 0
	pass
