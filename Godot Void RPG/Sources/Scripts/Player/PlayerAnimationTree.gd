extends AnimationTree

var smoothedVelocity: Vector3

func _animate_player(delta, player_body):

	var local_velocity = player_body.velocity * player_body.basis
	local_velocity = local_velocity.normalized()
	
	smoothedVelocity = lerp(smoothedVelocity, local_velocity, 0.1)
	print(smoothedVelocity)
	
	set("parameters/Movement_Blend_Space/blend_position", Vector2(smoothedVelocity.x, -smoothedVelocity.z))
	pass
