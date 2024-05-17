class_name NPC
extends Node3D

@export var npc_name: String
@export var dialog_sprite: Texture
@export var available_quest: int

@onready var quest_available_icon = $QuestAvailableIcon
@onready var quest_in_progress_icon = $QuestInProgressIcon
@onready var quest_ready_for_turn_in_icon = $QuestReadyForTurnInIcon

func _ready():
	
	await get_tree().create_timer(0.1).timeout
	update_quest_indicator()
	pass;

func update_quest_indicator():
	while(true):
		var quest = get_node("/root/Main/QuestManager").quests[available_quest]

		if(quest.status == QuestManager.QuestStatus.Available):
			
			quest_available_icon.visible = true
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = false
			
		elif(quest.status == QuestManager.QuestStatus.InProgress):
			
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = true
			quest_ready_for_turn_in_icon.visible = false
			
		elif(quest.status == QuestManager.QuestStatus.ReadyForTurnIn):
			
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = true
			
		elif(quest.status == QuestManager.QuestStatus.Done):
			
			quest_available_icon.visible = false
			quest_in_progress_icon.visible = false
			quest_ready_for_turn_in_icon.visible = false
			pass
			
		await get_tree().create_timer(1.0).timeout
		pass
	pass

func interact():
	print(str("speaking with ", npc_name))
	look_at(get_node("/root/Main/Player/PlayerBody").global_position)
	pass
