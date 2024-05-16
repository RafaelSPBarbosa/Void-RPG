class_name QuestManager

extends Node

var quests: Array

enum QuestStatus
{
	Available,
	InProgress,
	ReadyForTurnIn,
	Done
}

func _ready():
	quests.append({id = 0, title = "Void Extermination", description = "Defeat 10 different void monkeys and return to Mr. Capsule for your reward", status = QuestStatus.Available, progress = 0, goal = 10})
	pass

func accept_quest(id):
	if(quests[id].status == QuestStatus.Available):
		quests[id].status = QuestStatus.InProgress
		print(str("Accepted quest ", quests[id].title))
		pass
	pass
	
func is_quest_available(id):
	if(quests[id].status == QuestStatus.Available):
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
		pass
	pass
