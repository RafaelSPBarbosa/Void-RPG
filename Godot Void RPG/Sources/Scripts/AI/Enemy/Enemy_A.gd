class_name Enemy_A
extends Enemy

	
func die():
	get_node("/root/Main/QuestManager").add_progress(0)
	super.die()
	pass
