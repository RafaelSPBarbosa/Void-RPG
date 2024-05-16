extends Node

@onready var progress_panel = $"."
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	progress_panel.modulate.a = 0
	pass # Replace with function body.

func ShowMessage(message):
	print(message)
	label.text = message
	
	var tween = get_tree().create_tween() 
	tween.tween_property(progress_panel, "modulate:a", 1.0 , 0.5).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	
	await get_tree().create_timer(2.0).timeout
	
	tween = get_tree().create_tween() 
	tween.tween_property(progress_panel, "modulate:a", 0.0 , 0.5).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	
	pass
