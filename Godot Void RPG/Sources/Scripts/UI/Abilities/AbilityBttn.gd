class_name AbilityBttn

extends TextureRect
@onready var color_rect = $ColorRect
@export var cur_cooldown:float = 1.0
@export var hidden_y_pos:float = 75
@export var ability:Ability

func _ready():
	update_ui(1)
	pass

func _process(delta):
	color_rect.position.y = lerp(0.0, hidden_y_pos, cur_cooldown)
	pass


func update_ui(level):
	if(level < ability.minimum_level):
		visible = false
	else:
		visible = true
		pass
	pass


func _on_player_on_player_leveled_up(level):
	update_ui(level)
	pass
