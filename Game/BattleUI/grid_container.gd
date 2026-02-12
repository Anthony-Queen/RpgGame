extends GridContainer

var FireBall = load("res://data/FireBall.tres")
var Ice = load("res://data/Ice.tres")
var Light = load("res://data/Light.tres")
var Darkness = load("res://data/Darkness.tres")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Button.text = "Punch"
	$Button2.text = Ice.name
	$Button3.text = Light.name
	$Button4.text = Darkness.name
