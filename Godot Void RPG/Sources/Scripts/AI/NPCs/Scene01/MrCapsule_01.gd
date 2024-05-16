extends NPC

var hasQuest:bool = true;

func interact():
	super.interact()
	
	if(get_node("/root/Main/QuestManager").is_quest_available(0)):
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
	else:
			
		pass
	pass
