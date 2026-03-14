extends GridContainer

# FireBall
var FireBallResource = load("res://data/Attacks/FireBall.tres")
var FireBall = FireBallResource.duplicate()

#Ice Attack
var IceResource = load("res://data/Attacks/Ice.tres")
var Ice = IceResource.duplicate()

#Light Attack
var LightResource = load("res://data/Attacks/Light.tres")
var Light = LightResource.duplicate()

# Darkness Attack
var DarknessResource = load("res://data/Attacks/Darkness.tres")
var Darkness = DarknessResource.duplicate()

# Normal Weapon Attack (No Mana)
var Weapon = preload("res://data/Attacks/Weapon.tres")

func _ready():
	$Attack1.text = Weapon.name
	$Attack2.text = Ice.name
	$Attack3.text = FireBall.name
	$Attack4.text = Darkness.name


func _on_attack_1_pressed() -> void:
	if Globals.current_enemy:
		print("Enemy Health BEFORE:", Globals.current_enemy.Health)
		Globals.current_enemy.Health -= Weapon.Damage
		print("Weapon Damage:", Weapon.Damage)
		print("Enemy Health AFTER:", Globals.current_enemy.Health)
	else:
		print("No enemy assigned!")
