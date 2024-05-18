extends NPC

func _init():
	available_quests = [1,2]
	pass

func interact():
	super.interact()
	
	for target_quest in available_quests:
		var quest = get_node("/root/Main/QuestManager").quests[target_quest]
		if(target_quest == 1):
			if quest.status == QuestManager.QuestStatus.ReadyForTurnIn:
				get_node("/root/Main/QuestManager").deliver_quest(target_quest)
				var dialog: Array
				dialog = [
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Hey Waddles, glad your're here"
					},
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Grab me that cube over there, please"
					},
					{
						quest = 2
					}
				]
				get_node("/root/Main/DialogSystem").start_dialog(self, dialog)
				
			elif quest.status == QuestManager.QuestStatus.Done:
				var dialog: Array
				dialog = [
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Thanks for the help!"
					}
				]
				get_node("/root/Main/DialogSystem").start_dialog(self, dialog)
				pass
			pass
			
		elif (target_quest == 2):
			if quest.status == QuestManager.QuestStatus.ReadyForTurnIn:
				get_node("/root/Main/QuestManager").deliver_quest(target_quest)
				var dialog: Array
				dialog = [
					{
					speaker_sprite = null,
					location = DialogSystem.Location.Left,
					speaker = "Waddles",
					message = "Mr. Capsule, Here's the cube!"
					},
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Good  job!"
					}
				]
				get_node("/root/Main/DialogSystem").start_dialog(self, dialog)
				
			elif quest.status == QuestManager.QuestStatus.Done:
				var dialog: Array
				dialog = [
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Thanks for the help!"
					}
				]
				get_node("/root/Main/DialogSystem").start_dialog(self, dialog)
				pass
			pass
		pass
	pass
