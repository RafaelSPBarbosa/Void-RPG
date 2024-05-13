class_name PlayerAbilityArea3D
extends Area3D

var enemies: Array

func _on_body_entered(body):
	if(body.is_in_group("Enemies")):
		enemies.append(body)
		pass
	pass

func _on_body_exited(body):
	var index: int = -1
	var i: int = 0
	for b in enemies:
		if(b == body):
			index = i
			i += 1
			pass
		pass
		
	if(index > -1):
		enemies.remove_at(index)
	pass
