extends GridContainer

var FireBall = load("res://data/Attacks/FireBall.tres")
var Ice = load("res://data/Attacks/Ice.tres")
var Light = load("res://data/Attacks/Light.tres")
var Darkness = load("res://data/Attacks/Darkness.tres")

func _process(delta: float) -> void:
	$Button.text = "Punch"
	$Button2.text = Ice.name
	$Button3.text = Light.name
	$Button4.text = Darkness.name
