class_name NPC
extends Node3D

@export var npc_name: String
@export var dialog_sprite: Texture

func interact():
	print(str("speaking with ", npc_name))
	look_at(get_node("/root/Main/Player/PlayerBody").global_position)
	pass
