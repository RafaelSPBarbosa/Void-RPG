class_name DialogSystem
extends Node

@onready var dim = $CanvasLayer/Control/Dim
@onready var canvas_layer = $CanvasLayer
@onready var control = $CanvasLayer/Control

@onready var tutorial_text = $CanvasLayer/Control/tutorial_text

@onready var character_left = $CanvasLayer/Control/Character_Left
@onready var dialog_left = $CanvasLayer/Control/Dialog_Left
@onready var speaker_left = $CanvasLayer/Control/Dialog_Left/Speaker
@onready var message_left = $CanvasLayer/Control/Dialog_Left/Message

@onready var character_right = $CanvasLayer/Control/Character_Right
@onready var dialog_right = $CanvasLayer/Control/Dialog_Right
@onready var speaker_right = $CanvasLayer/Control/Dialog_Right/Speaker
@onready var message_right = $CanvasLayer/Control/Dialog_Right/Message

@onready var accept_or_refuse = $CanvasLayer/Control/AcceptOrRefuse
var decision: int = 0

@export var placeholder_waddles: Texture

var is_visible = false
var character_left_sprite: Texture = null
var character_right_sprite: Texture = null

enum Location {
	Left,
	Right
}

func _ready():
	control.visible = true
	
	dim.self_modulate.a = 0.0
	
	character_left.set_position(Vector2(-1000, character_left.get_screen_position().y))
	dialog_left.visible = false
	
	character_right.set_position(Vector2(1000, character_left.get_screen_position().y))
	dialog_right.visible = false
	
	tutorial_text.visible = false
	
	accept_or_refuse.modulate.a = 0.0
	pass

func start_dialog(speaker, dialog):
	if(is_visible == false):
		is_visible = true;
		var tween = get_tree().create_tween() 
		tween.tween_property(dim, "self_modulate:a", 1.0, 1).set_trans(Tween.TRANS_CUBIC)
		
		await get_tree().create_timer(1.0).timeout
			
		for line in dialog:
			if(!line.has('quest')):
				var speaker_sprite = line.speaker_sprite
				if speaker_sprite == null:
					speaker_sprite = placeholder_waddles
					pass
					
				speak(speaker_sprite, line.location, line.speaker, line.message)
				tutorial_text.visible = true
				await get_tree().create_timer(1.0).timeout
				
				await Engine.get_main_loop().process_frame
				while(!Input.is_action_just_pressed("LMB")):
					await Engine.get_main_loop().process_frame
					pass
				pass
			else:
				if(!line.has('refusable')):
					var decision_tween = get_tree().create_tween() 
					decision_tween.tween_property(accept_or_refuse, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_CUBIC)
					decision = 0
					await get_tree().create_timer(1.0).timeout
					
					while(decision == 0):
						await Engine.get_main_loop().process_frame
						pass
						
					accept_or_refuse.modulate.a = 0.0
						
					if(decision == 1):
						get_node("/root/Main/QuestManager").accept_quest(line.quest)
						decision = 0
					elif(decision == -1):
						decision = 0
						pass
					pass
				else:
					get_node("/root/Main/QuestManager").accept_quest(line.quest)
				pass
		
		#await Engine.get_main_loop().process_frame
		#while(!Input.is_action_just_pressed("LMB")):
			#await Engine.get_main_loop().process_frame
		
		tutorial_text.visible = false
		
		end_dialog()
		pass
	pass
	
func end_dialog():	
	dialog_left.visible = false
	dialog_right.visible = false
	
	character_left_sprite = null
	character_right_sprite = null
	
	var tween_left = get_tree().create_tween() 
	tween_left.tween_property(character_left, "position", Vector2(-1000, character_left.get_screen_position().y) , 1).set_trans(Tween.TRANS_CUBIC)
	
	var tween_right = get_tree().create_tween() 
	tween_right.tween_property(character_right, "position", Vector2(1000, character_right.get_screen_position().y) , 1).set_trans(Tween.TRANS_CUBIC)
	await tween_left.finished
	
	var tween = get_tree().create_tween() 
	tween.tween_property(dim, "self_modulate:a", 0.0, 1).set_trans(Tween.TRANS_CUBIC)
	is_visible = false;
	pass

func speak(character_sprite: Texture, location: Location, name: String, message: String):
	if(location == Location.Left):
		dialog_right.visible = false
		if(character_left_sprite == null || character_left_sprite != character_sprite):
			character_left_sprite = character_sprite
			character_left.texture = character_sprite
			character_left.set_position(Vector2(-1000, character_left.get_screen_position().y))
			var tween = get_tree().create_tween() 
			tween.tween_property(character_left, "position", Vector2(-133, character_left.get_screen_position().y) , 1).set_trans(Tween.TRANS_CUBIC)
			await tween.finished
			pass
		
		speaker_left.text = name
		message_left.text = message
		dialog_left.visible = true
		pass
		
	if(location == Location.Right):
		dialog_left.visible = false
		if(character_right_sprite == null || character_right_sprite != character_sprite):
			character_right_sprite = character_sprite
			character_right.texture = character_sprite
			character_right.set_position(Vector2(1000, character_right.get_screen_position().y))
			var tween = get_tree().create_tween() 
			tween.tween_property(character_right, "position", Vector2(538, character_right.get_screen_position().y) , 1).set_trans(Tween.TRANS_CUBIC)
			await tween.finished
			pass
		
		speaker_right.text = name
		message_right.text = message
		dialog_right.visible = true
		pass
	pass


func _on_accept_bttn_pressed():
	decision = 1
	pass


func _on_refuse_bttn_pressed():
	decision = -1
	pass
