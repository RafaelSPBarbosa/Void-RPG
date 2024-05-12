class_name EnemyMovement
extends Node

var speed = 5
var accel = 10
var target_pos: Vector3

@onready var enemy_target = $"../../../EnemyTarget"
@onready var nav = $"../../NavigationAgent3D"
@onready var enemy_a = $"../.."

func _ready():
	target_pos = enemy_target.global_position
	pass

func _physics_process(delta):
	_move(delta)
	
	pass


func _move(delta):
	var direction = Vector3()
	
	if(enemy_a.is_aggroed):
		target_pos = %Player.player_body.global_position
		pass
		
	nav.target_position = target_pos
	
	direction = nav.get_next_path_position() - enemy_a.global_position
	direction = direction.normalized()
	
	if(enemy_a.global_position.distance_to( target_pos ) > 2.0):
		enemy_a.velocity = enemy_a.velocity.lerp(direction * speed, accel * delta)
		_rotate_towards_movement(delta, nav.get_next_path_position())
	else:
		enemy_a.velocity = enemy_a.velocity.lerp(Vector3(0,0,0), accel * delta)
		_rotate_towards_target(delta)
		pass

	enemy_a.move_and_slide()
	pass
	
func _rotate_towards_target(delta):
	enemy_a.look_at(target_pos)
	pass
	
func _rotate_towards_movement(delta, velocity):
	enemy_a.look_at(velocity)
	pass
