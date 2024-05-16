class_name InteractableItem_Cube
extends Node

func interact():
	get_node("/root/Main/HUD/ProgressPanel").ShowMessage("You picked up a cube!")
	#TODO: Add mission progress
	queue_free()
	pass
