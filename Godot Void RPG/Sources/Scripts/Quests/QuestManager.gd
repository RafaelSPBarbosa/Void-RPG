class_name QuestManager
extends Node

@onready var quest_1 = $Panel/VBoxContainer/Quest1
@onready var quest_2 = $Panel/VBoxContainer/Quest2
@onready var quest_3 = $Panel/VBoxContainer/Quest3
@onready var quest_4 = $Panel/VBoxContainer/Quest4
@onready var quest_5 = $Panel/VBoxContainer/Quest5
@onready var quest_6 = $Panel/VBoxContainer/Quest6
@onready var quest_7 = $Panel/VBoxContainer/Quest7


var quests: Array

enum QuestStatus
{
	Available,
	InProgress,
	ReadyForTurnIn,
	Done
}

func _ready():
	quests.append({id = 0, title = "Void Extermination", description = "Defeat 2 different void monkeys and return to Mr. Capsule for your reward", status = QuestStatus.Available, progress = 0, goal = 2})
	pass
	
func update_quest_log():
	var i = -1;
	
	for quest in quests:
		if(quest.status == QuestStatus.InProgress or quest.status == QuestStatus.ReadyForTurnIn):
			print(str(i, "is an available quest"))
			i += 1
			
			var quest_string = str(quests[i].title, "\n", quests[i].description, "\n", quests[i].progress, " / ", quests[i].goal);
			if(quest.status == QuestStatus.ReadyForTurnIn):
				quest_string = str(quests[i].title, "\n", quests[i].description, "\n", "Done");
				pass
			
			if i == 0:
				quest_1.text = quest_string
			elif i == 1:
				quest_2.text = quest_string
			elif i == 2:
				quest_3.text = quest_string
			elif i == 3:
				quest_4.text = quest_string
			elif i == 4:
				quest_5.text = quest_string
			elif i == 5:
				quest_6.text = quest_string
			elif i == 6:
				quest_7.text = quest_string
				pass
			
			pass
		pass
	
	if i < 6:
		quest_7.text = ""
	elif i < 5:
		quest_7.text = ""
		quest_6.text = ""
	elif i < 4:
		quest_7.text = ""
		quest_6.text = ""
		quest_5.text = ""
	elif i < 3:
		quest_7.text = ""
		quest_6.text = ""
		quest_5.text = ""
		quest_4.text = ""
	elif i < 2:
		quest_7.text = ""
		quest_6.text = ""
		quest_5.text = ""
		quest_4.text = ""
		quest_3.text = ""
	elif i < 1:
		quest_7.text = ""
		quest_6.text = ""
		quest_5.text = ""
		quest_4.text = ""
		quest_3.text = ""
		quest_2.text = ""
	elif i < 0:
		quest_7.text = ""
		quest_6.text = ""
		quest_5.text = ""
		quest_4.text = ""
		quest_3.text = ""
		quest_2.text = ""
		quest_1.text = ""
	pass

func accept_quest(id):
	if(quests[id].status == QuestStatus.Available):
		quests[id].status = QuestStatus.InProgress
		print(str("Accepted quest ", quests[id].title))
		update_quest_log()
		pass
	pass

func deliver_quest(id):
	if(quests[id].status == QuestStatus.ReadyForTurnIn):
		quests[id].status = QuestStatus.Done
		print(str("Completed quest ", quests[id].title))
		update_quest_log()
		pass
	pass	

func is_quest_available(id):
	if(quests[id].status == QuestStatus.Available):
		return true
	else:
		return false
		pass
	pass
	
func is_quest_ready_for_turn_in(id):
	if(quests[id].status == QuestStatus.ReadyForTurnIn):
		return true
	else:
		return false
		pass
	pass

func add_progress(id):
	if(quests[id].status == QuestStatus.InProgress):
		quests[id].progress += 1
		print(str(quests[id].title, " is at ", quests[id].progress, " out of ", quests[id].goal))
		
		if(quests[id].progress >= quests[id].goal):
			print(str("finished quest ", quests[id].title))
			quests[id].status = QuestStatus.ReadyForTurnIn
			pass
			
		update_quest_log()
		pass
	pass
