class_name Ability
extends Resource

@export var name: String
@export var cooldown_duration: float = 1

func use():
	print(str("Using Ability: ", name))
	pass
