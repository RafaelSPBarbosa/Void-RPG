class_name Sweep
extends Ability

var damage_per_level:Array = [0, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80]

func use(player):
	if(player.level < minimum_level):
		print("Player is not high level enough to use this ability")
		return
		pass
		
	super.use(player)
	
	player.animation_tree.animate_sweep()
	
	var index = -1
	for enemy in player.player_abilities.sweep_area3D.enemies:
		if(is_instance_valid(enemy)):
			enemy.take_damage(damage_per_level[player.level])
		else:
			player.player_abilities.sweep_area3D.enemies.remove_at(index)
			index += 1
			pass
		pass
	pass
