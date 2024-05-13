class_name EnemySpawner
extends Node3D

@export var enemyType: EnemyType

enum EnemyType {
	A
}

@export var respawn_time: float = 20
var time_since_enemy_death: float = 0

var enemy: Enemy

func _ready():
	spawn_new()
	pass

func _physics_process(delta):
	if(!is_instance_valid(enemy)):
		time_since_enemy_death += delta
		if(time_since_enemy_death >= respawn_time):
			spawn_new()
			pass
		pass
	pass
	
func spawn_new():
	time_since_enemy_death = 0
	var scene = preload("res://Prefabs/Enemies/enemy_a.tscn")
	enemy = scene.instantiate()
	add_child(enemy)
	enemy.global_position = global_position
	pass
