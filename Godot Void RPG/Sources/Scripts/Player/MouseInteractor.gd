class_name MouseInteractor
extends Node3D

@onready var camera_3d = $".."
@onready var player_body = $"../../../../PlayerBody"

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var from = camera_3d.project_ray_origin(event.position)
		var to = from + camera_3d.project_ray_normal(event.position) * 1000
		var space = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(from, to)
		var results = space.intersect_ray(query)
		
		if results:
			if(results.collider.get_parent().is_in_group("NPCs") or results.collider.get_parent().is_in_group("InteractableItem")):
				if(player_body.global_position.distance_to(results.collider.get_parent().global_position) < 6.0):
					results.collider.get_parent().interact()
				pass
			pass
	pass
