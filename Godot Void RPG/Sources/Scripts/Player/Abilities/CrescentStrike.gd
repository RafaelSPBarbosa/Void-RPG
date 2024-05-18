class_name CrescentStrike
extends Ability

@export var damage:int = 10

func use(player):
	if(player.level < minimum_level):
		print("Player is not high level enough to use this ability")
		return
		pass
	
	super.use(player)
	
	player.animation_tree.animate_crescent_strike()
	
	var index = -1
	for enemy in player.player_abilities.crescent_strike_area3D.enemies:
		if(is_instance_valid(enemy)):
			enemy.take_damage(damage)
		else:
			player.player_abilities.crescent_strike_area3D.enemies.remove_at(index)
			index += 1
			pass
		pass
	pass
