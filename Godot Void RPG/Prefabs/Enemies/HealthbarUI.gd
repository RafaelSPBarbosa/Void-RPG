class_name HealthbarUI
extends Node3D

@onready var enemy_a = $".."
@onready var progress_bar = $SubViewport/Control/ProgressBar

func _process(delta):
	look_at(get_node("/root/Main/Player").player_camera.global_position)
	progress_bar.value = float(enemy_a.health) / float(enemy_a.max_health)
	pass
