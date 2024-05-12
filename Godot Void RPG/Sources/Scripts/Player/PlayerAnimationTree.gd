extends AnimationTree

@export var movement_vector: Vector2

func _process(delta):
	set("parameters/Movement_Blend_Space/blend_position", movement_vector)
	pass
