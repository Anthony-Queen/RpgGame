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
	if Globals.current_enemy:
		Globals.current_enemy.Health -= Weapon.damage
		print("Weapon Damage:", Weapon.damage)
		print(Globals.current_enemy.Health)
		Battle.ChangeTurn(Globals.current_enemy_node)
	else:
		print("No enemy assigned!")
