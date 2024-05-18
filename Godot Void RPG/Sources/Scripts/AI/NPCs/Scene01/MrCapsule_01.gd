extends NPC

func _init():
	available_quests = [0]
	pass

func interact():
	super.interact()
	
	for target_quest in available_quests:
		var quest = get_node("/root/Main/QuestManager").quests[target_quest]
		if(target_quest == 0):
			if(quest.status == QuestManager.QuestStatus.Available):
				var dialog: Array
				dialog = [
					{
					speaker_sprite = null,
					location = DialogSystem.Location.Left,
					speaker = "Waddles",
					message = "Hey, I came as fast as I could!"
					},
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Hey Waddles, good thing you're here! We need to clear out these void monkeys, can you defeat 10 of em for me?"
					},
					{
					speaker_sprite = null,
					location = DialogSystem.Location.Left,
					speaker = "Waddles",
					message = "Of course! Leave it to me, Mr. Capsule!"
					},
					{
					quest = 0
					}
				]
					
				get_node("/root/Main/DialogSystem").start_dialog(self, dialog)
				
			elif quest.status == QuestManager.QuestStatus.ReadyForTurnIn:
				get_node("/root/Main/QuestManager").deliver_quest(target_quest)
				var dialog: Array
				dialog = [
					{
					speaker_sprite = null,
					location = DialogSystem.Location.Left,
					speaker = "Waddles",
					message = "Mr. Capsule, I've done it, the void monkeys are no more!"
					},
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "Hey, good job Waddles! The town will certainly be safer now"
					},
					{
					speaker_sprite = dialog_sprite,
					location = DialogSystem.Location.Right,
					speaker = npc_name,
					message = "You should head over to Mr. Capsule_2, he's got another quest for you"
					},
					{
						quest = 1,
						refusable = false
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
