extends Node3D
@onready var player_body = $"../PlayerBody"
@onready var player_camera = $"../PlayerCamera"
@export var mov_speed: float

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
	global_transform.basis = player_camera.global_transform.basis;
	pass
