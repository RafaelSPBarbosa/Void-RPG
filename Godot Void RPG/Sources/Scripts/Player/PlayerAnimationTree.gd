extends AnimationTree

var smoothedVelocity: Vector3

func _animate_player(delta, player_body):

	var local_velocity = player_body.velocity * player_body.basis
	local_velocity = local_velocity.normalized()
	
	smoothedVelocity = lerp(smoothedVelocity, local_velocity, 0.1)
	
	set("parameters/StateMachine/Movement_Blend_Space/blend_position", Vector2(smoothedVelocity.x, -smoothedVelocity.z))
	
	pass
	
func animate_crescent_strike():
	set("parameters/StateMachine/conditions/CrescentStrike", true)
	await get_tree().create_timer(0.1).timeout
	set("parameters/StateMachine/conditions/CrescentStrike", false)
	pass

func animate_true_shot():
	set("parameters/StateMachine/conditions/TrueShot", true)
	await get_tree().create_timer(0.1).timeout
	set("parameters/StateMachine/conditions/TrueShot", false)
	pass
	
func animate_ground_smack():
	set("parameters/StateMachine/conditions/GroundSmack", true)
	await get_tree().create_timer(0.1).timeout
	set("parameters/StateMachine/conditions/GroundSmack", false)
	pass
	
func animate_sweep():
	set("parameters/StateMachine/conditions/Sweep", true)
	await get_tree().create_timer(0.1).timeout
	set("parameters/StateMachine/conditions/Sweep", false)
	pass
