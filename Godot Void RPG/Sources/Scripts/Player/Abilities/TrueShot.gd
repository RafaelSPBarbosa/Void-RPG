class_name TrueShot
extends Ability

@export var damage:int = 15

func use(player):
	super.use(player)
	
	player.animation_tree.animate_true_shot()
	
	var index = -1
	for enemy in player.player_abilities.true_shot_area3D.enemies:
		if(is_instance_valid(enemy)):
			enemy.take_damage(damage)
		else:
			player.player_abilities.true_shot_area3D.enemies.remove_at(index)
			index += 1
			pass
		pass
	pass
