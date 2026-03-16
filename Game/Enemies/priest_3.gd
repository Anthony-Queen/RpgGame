extends "res://Game/enemy.gd"

var heal_mode := false

func _physics_process(_delta):
	SmartHeal()

func SmartHeal():
	if data.Health < 30 and heal_mode == false:
		print("Heal Mode type splisha")
		heal_mode = true
		data.ProbAtt -= 0.40
		data.ProbDef += 0.20
