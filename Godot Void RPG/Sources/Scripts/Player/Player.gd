class_name  Player
extends Node

@export var health: int = 100
@export var max_health: int = 100

@onready var player_camera = $PlayerCamera/Pivot/Camera3D
@onready var player_body = $PlayerBody
@onready var animation_tree = $PlayerBody/Penguin/AnimationTree
@onready var player_abilities = $PlayerBody/PlayerAbilities

func _process(delta):
	get_node("/root/Main/HUD/PlayerPanel/ProgressBar").value = float(health) / float(max_health)
	pass

func take_damage(damage):
	health -= damage
	print (str("Player took ", damage, " damage"))
	if(health <= 0):
		die()
		pass
	pass
	
func die():
	print("Player died")
	pass
