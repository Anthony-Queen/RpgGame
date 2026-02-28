extends CharacterBody2D
@export var data: Enemy
var En_Health
signal enemy_attack
signal enemy_defend
signal enemy_heal


func _ready():
	add_to_group("enemy")

func decide():
	while En_Health > 0:
		var random = randf()
		if random < 0.55:
			emit_signal("enemy_attack")
		elif random < 0.35:
			emit_signal("enemy_defend")
		else: 
			emit_signal("enemy_heal")


func _physics_process(_delta):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("Default")
