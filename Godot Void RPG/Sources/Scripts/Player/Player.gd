class_name  Player
extends Node

@export var health: int = 100
@export var maxHealth: int = 100

@onready var player_body = $PlayerBody
@onready var animation_tree = $PlayerBody/Penguin/AnimationTree
@onready var player_abilities = $PlayerBody/PlayerAbilities
