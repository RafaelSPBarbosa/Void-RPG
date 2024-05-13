class_name AbilitiesBar
extends Node

@export var Abilities: Array[AbilityBttn]

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Abilities[3].ability.cooldown_duration)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in Abilities.size():
		Abilities[i].cur_cooldown -= ( 1 * delta ) / Abilities[i].ability.cooldown_duration
		if(Abilities[i].cur_cooldown <= 0):
			Abilities[i].cur_cooldown = 0
		
		if(Abilities[i].cur_cooldown <= 0):
			if(Input.is_action_just_pressed(str("Ability0", (i + 1)))):
				Abilities[i].cur_cooldown = 1.0
				Abilities[i].ability.use(%Player)
		pass
	pass
