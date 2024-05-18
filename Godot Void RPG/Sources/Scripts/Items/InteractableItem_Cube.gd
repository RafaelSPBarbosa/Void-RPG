class_name InteractableItem_Cube
extends Node

var interactable: bool = false
@onready var cpu_particles_3d = $CPUParticles3D

func _ready():
	cpu_particles_3d.emitting = false
	pass

func interact():
	if(interactable == true):
		get_node("/root/Main/HUD/ProgressPanel").ShowMessage("You picked up a cube!")
		get_node("/root/Main/QuestManager").add_progress(2);
		queue_free()
		pass
	pass


func _on_quest_manager_on_quest_accepted(event):
	if(event == "Enable_Cube_01"):
		interactable = true
		cpu_particles_3d.emitting = true
		pass
	pass
