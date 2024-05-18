class_name Ability
extends Resource

@export var name: String
@export var cooldown_duration: float = 1
@export var minimum_level: int = 1

func use(player):
	print(str("Using Ability: ", name))
	pass
