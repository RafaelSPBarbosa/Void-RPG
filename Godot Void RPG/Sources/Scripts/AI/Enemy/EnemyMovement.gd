class_name EnemyMovement
extends Node

var speed = 5
var accel = 10
var target_pos: Vector3

@onready var nav = $"../../NavigationAgent3D"
@onready var enemy_a = $"../.."

var idle_positions: Array
var cur_idle_position_index: int = 0

func _ready():
	idle_positions.append(Vector3(enemy_a.global_position.x + randf() * 20.0, enemy_a.global_position.y, enemy_a.global_position.z + randf() * 20.0))
	idle_positions.append(Vector3(enemy_a.global_position.x + randf() * 20.0, enemy_a.global_position.y, enemy_a.global_position.z + randf() * 20.0))
	idle_positions.append(Vector3(enemy_a.global_position.x + randf() * 20.0, enemy_a.global_position.y, enemy_a.global_position.z + randf() * 20.0))
	
	while(enemy_a.health >= 0):
		target_pos = idle_positions[cur_idle_position_index]
		cur_idle_position_index += 1
		if(cur_idle_position_index >= idle_positions.size()):
			cur_idle_position_index = 0
			pass
		await get_tree().create_timer(2).timeout
		pass
	pass

func _physics_process(delta):
	_move(delta)
	
	pass


func _move(delta):
	var direction = Vector3()
	
	if(enemy_a.is_aggroed):
		target_pos = get_node("/root/Main/Player").player_body.global_position
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
