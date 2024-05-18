class_name Enemy
extends Node3D

@onready var area_3d = $Area3D
@onready var ai_movement = $CharacterBody3D/Scripts/AIMovement
@onready var character_body_3d = $CharacterBody3D
@export var is_aggroed: bool = false

@export var health: int = 100
@export var max_health: int = 100

@export var xp_worth = 10

@export var damage: int = 5
@export var time_between_attacks: float = 3
var time_since_last_attack = 0

func _physics_process(delta):
	time_since_last_attack += delta
	var player = get_node("/root/Main/Player")
	if(time_since_last_attack >= time_between_attacks && global_position.distance_to(player.player_body.global_position) < 3.0):
		time_since_last_attack = 0
		player.take_damage(damage)
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
	get_node("/root/Main/Player").earn_xp(xp_worth)
	queue_free()
	pass
	
func stop_attacking():
	
	pass
	
func start_attacking():
	time_since_last_attack = 0
	pass
