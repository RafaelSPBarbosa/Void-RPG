class_name NPC
extends Node3D

@export var npc_name: String
@export var dialog_sprite: Texture
var available_quests: Array[int]

@onready var quest_available_icon = $QuestAvailableIcon
@onready var quest_in_progress_icon = $QuestInProgressIcon
@onready var quest_ready_for_turn_in_icon = $QuestReadyForTurnInIcon

func _ready():
	
	await get_tree().create_timer(0.1).timeout
	update_quest_indicator()
	pass;

func update_quest_indicator():
	while(true):
		var quest_locked = false
		var quest_available = false
		var quest_in_progress = false
		var quest_ready_for_turn_in = false
		var quest_done = false
	
		for target_quest in available_quests:
			var quest = get_node("/root/Main/QuestManager").quests[target_quest]
			if(quest.status == QuestManager.QuestStatus.Locked):
				quest_locked = true

			elif(quest.status == QuestManager.QuestStatus.Available):
				quest_available = true
				
			elif(quest.status == QuestManager.QuestStatus.InProgress):
				quest_in_progress = true
				
			elif(quest.status == QuestManager.QuestStatus.ReadyForTurnIn):
				quest_ready_for_turn_in = true
				
			elif(quest.status == QuestManager.QuestStatus.Done):
				quest_done = true
				pass
			pass

		if(quest_done):
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = false
			
		if(quest_locked):
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = false
			
		if(quest_in_progress):
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = true
			quest_ready_for_turn_in_icon.visible = false
			
		if(quest_available):
			quest_available_icon.visible = true
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = false
			
		if(quest_ready_for_turn_in):
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = true
			
		await get_tree().create_timer(1.0).timeout
		pass
	pass

func interact():
	print(str("speaking with ", npc_name))
	look_at(get_node("/root/Main/Player/PlayerBody").global_position)
	pass
