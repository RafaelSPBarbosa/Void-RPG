class_name EnemyMovement
extends Node3D

var speed = 5
var accel = 10
var target_pos: Vector3

@onready var nav = $"../../NavigationAgent3D"
@onready var enemy_a = $"../../.."
@onready var character_body_3d = $"../.."


var positions: Array [Node3D]
var cur_idle_position_index: int = 0
var is_in_range: bool = false

func _ready():
	await get_tree().create_timer(0.2).timeout
	while(enemy_a.health >= 0):
		target_pos = positions[cur_idle_position_index].global_position
		cur_idle_position_index += 1
		if(cur_idle_position_index >= positions.size()):
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
	print(nav.get_next_path_position())
	direction = nav.get_next_path_position() - character_body_3d.global_position
	direction = direction.normalized()
	
	if(character_body_3d.global_position.distance_to( target_pos ) > 2.0):
		character_body_3d.velocity = character_body_3d.velocity.lerp(direction * speed, accel * delta)
		_rotate_towards_movement(delta, nav.get_next_path_position())
		if(is_in_range):
			is_in_range = false
			enemy_a.stop_attacking()
			pass
	else:
		character_body_3d.velocity = character_body_3d.velocity.lerp(Vector3(0,0,0), accel * delta)
		_rotate_towards_target(delta)
		if(!is_in_range):
			is_in_range = true
			enemy_a.start_attacking()
			pass
		pass

	character_body_3d.move_and_slide()
	pass
	
func _rotate_towards_target(delta):
	var pos = target_pos
	pos.y = character_body_3d.global_position.y
	character_body_3d.look_at(pos)
	pass
	
func _rotate_towards_movement(delta, velocity):
	var pos = velocity
	pos.y = character_body_3d.global_position.y
	if(pos.distance_to(character_body_3d.global_position) > 0.1):
		character_body_3d.look_at(pos)
	pass
