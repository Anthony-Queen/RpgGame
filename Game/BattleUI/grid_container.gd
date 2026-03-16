extends GridContainer

# Attacks
var FireBall = load("res://data/Attacks/FireBall.tres")
var Ice = load("res://data/Attacks/Ice.tres")
var Light = load("res://data/Attacks/Light.tres")
var Darkness = load("res://data/Attacks/Darkness.tres")
var Weapon = load("res://data/Attacks/Weapon.tres")

func _ready():
	$Attack1.text = Weapon.name
	$Attack2.text = Ice.name
	$Attack3.text = FireBall.name
	$Attack4.text = Darkness.name


func _on_attack_1_pressed() -> void:
	if Globals.isEnemyDefending == false:
		Globals.current_enemy.Health -= Weapon.damage
		print(Globals.current_enemy.Health)
		Battle.ChangeTurn(Globals.current_enemy_node)
	else:
		Globals.current_enemy.Health -= Weapon.damage * 0.3
		print(Globals.current_enemy.Health)
		Battle.ChangeTurn(Globals.current_enemy_node)

func _on_attack_2_pressed() -> void:
	if Globals.isEnemyDefending == false:
		if Globals.current_mana >= Ice.mana:
			Globals.current_mana -= Ice.mana
			Globals.current_enemy.Health -= Ice.damage
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")
	else:
		if Globals.current_mana >= Ice.mana:
			Globals.current_mana -= Ice.mana
			Globals.current_enemy.Health -= Ice.damage * 0.3
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")

func _on_attack_3_pressed() -> void:
	if Globals.isEnemyDefending == false:
		if Globals.current_mana >= FireBall.mana:
			Globals.current_mana -= FireBall.mana
			Globals.current_enemy.Health -= FireBall.damage
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")
	else:
		if Globals.current_mana >= FireBall.mana:
			Globals.current_mana -= FireBall.mana
			Globals.current_enemy.Health -= FireBall.damage * 0.3
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")

func _on_attack_4_pressed() -> void:
	if Globals.isEnemyDefending == false:
		if Globals.current_mana >= Darkness.mana:
			Globals.current_mana -= Darkness.mana
			Globals.current_enemy.Health -= Darkness.damage
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")
	else:
		if Globals.current_mana >= Darkness.mana:
			Globals.current_mana -= Darkness.mana
			Globals.current_enemy.Health -= Darkness.damage * 0.3
			print(Globals.current_enemy.Health)
			Battle.ChangeTurn(Globals.current_enemy_node)
		else:
			print("No Mana!")
