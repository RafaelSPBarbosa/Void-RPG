class_name  Player
extends Node

@export var health: int = 100
@export var max_health: int = 100
var level = 1
var xp = 0
var xp_to_level = [0, 100, 250, 500, 1000, 2000]

@onready var player_camera = $PlayerCamera/Pivot/Camera3D
@onready var player_body = $PlayerBody
@onready var animation_tree = $PlayerBody/Penguin/AnimationTree
@onready var player_abilities = $PlayerBody/PlayerAbilities
@onready var level_up_particles = $PlayerBody/LevelUpParticles

func _ready():
	update_level_ui()
	pass

func _process(delta):
	get_node("/root/Main/HUD/PlayerPanel/ProgressBar").value = float(health) / float(max_health)
	
	if(Input.is_action_just_pressed("Ability01")):
		earn_xp(50)
		pass
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

func earn_xp(amount):
	print(str("Player earned ", amount, " XP"))
	xp += amount
	update_level_ui()
	
	if(xp >= xp_to_level[level]):
		level_up()
		pass
	pass

func level_up():
	xp -= xp_to_level[level]
	level += 1
	update_level_ui()
	
	level_up_particles.emitting = true
	
	var tween = get_tree().create_tween() 
	var level_up_notice = get_node("/root/Main/HUD/LevelUpNotice")
	tween.tween_property(level_up_notice, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(2.0).timeout
	
	tween = get_tree().create_tween()
	tween.tween_property(level_up_notice, "modulate:a", 0.0, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	print(str("Player leveled up to level ", level))
	pass

func update_level_ui():
	get_node("/root/Main/HUD/ExperienceBar/ProgressBar").value = float(xp) / float(xp_to_level[level])
	get_node("/root/Main/HUD/PlayerPanel/Level").text = str("Level ", level)
	pass
