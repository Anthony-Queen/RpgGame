extends CharacterBody2D

func _ready():
	add_to_group("enemy")

func _physics_process(delta):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("Default")
