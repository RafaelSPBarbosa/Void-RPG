extends Node3D
@onready var player_body = $"../PlayerBody"
@onready var player_camera = $"../PlayerCamera"
@export var mov_speed: float
@onready var animation_tree = $Penguin/AnimationTree

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if(!player_body.is_on_floor()):
		direction.y -= gravity
		
	if get_node("/root/Main/DialogSystem").is_visible == false:
		if Input.is_action_pressed("move_forward"):
			direction += player_camera.global_transform.basis.z * -mov_speed
			
		if Input.is_action_pressed("move_backward"):
			direction += player_camera.global_transform.basis.z * mov_speed
			
		if Input.is_action_pressed("move_left"):
			direction += player_camera.global_transform.basis.x * -mov_speed

		if Input.is_action_pressed("move_right"):
			direction += player_camera.global_transform.basis.x * mov_speed
		pass
		
	player_body.velocity = direction
	player_body.move_and_slide()
	
	animation_tree._animate_player(delta, self)
	if(direction.length() > 0):
		global_transform.basis = player_camera.global_transform.basis;
		pass
	pass
