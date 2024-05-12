class_name AbilityBttn

extends TextureRect
@onready var color_rect = $ColorRect
@export var cur_cooldown:float = 1.0
@export var hidden_y_pos:float = 75
@export var ability:Ability

func _ready():
	#var tween = get_tree().create_tween() 
	#tween.tween_property(color_rect, "position", Vector2(0,hidden_y_pos), 1).set_trans(Tween.TRANS_ELASTIC)
	pass

func _process(delta):
	color_rect.position.y = lerp(0.0, hidden_y_pos, cur_cooldown)
	pass
