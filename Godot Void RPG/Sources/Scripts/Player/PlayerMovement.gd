extends Node3D
@onready var player_body = $"../PlayerBody"
@onready var player_camera = $"../PlayerCamera"
@export var mov_speed: float
@onready var animation_tree = $Penguin/AnimationTree

var smoothedVelocity: Vector3

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		direction += player_camera.global_transform.basis.z * -mov_speed
		
	if Input.is_action_pressed("move_backward"):
		direction += player_camera.global_transform.basis.z * mov_speed
		
	if Input.is_action_pressed("move_left"):
		direction += player_camera.global_transform.basis.x * -mov_speed

	if Input.is_action_pressed("move_right"):
		direction += player_camera.global_transform.basis.x * mov_speed
		
	player_body.velocity = direction
	player_body.move_and_slide()
	_animate_player()
	global_transform.basis = player_camera.global_transform.basis;
	pass

func _animate_player():
	var b = player_body.transform.basis
	var v_len = player_body.velocity.length()
	var v_nor = player_body.velocity.normalized()

	var vel : Vector3
	vel.x = b.x.dot(v_nor) * v_len
	vel.y = b.y.dot(v_nor) * v_len
	vel.z = b.z.dot(v_nor) * v_len
	
	smoothedVelocity = lerp(smoothedVelocity, vel, 0.5)
		
	animation_tree.movement_vector = Vector2(smoothedVelocity.x, smoothedVelocity.z)
	pass
