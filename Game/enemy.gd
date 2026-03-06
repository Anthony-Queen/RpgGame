extends CharacterBody2D
@export var data: Enemy
var En_Health
signal enemy_attack
signal enemy_defend
signal enemy_heal


func _ready():
	add_to_group("enemy")
	En_Health = data.Health

func decide():
	if En_Health <= 0:
		return
	
	var random = randf()
	
	if random < 0.55:
		enemy_attack.emit()
	elif random < 0.85:
		enemy_defend.emit()
	else:
		enemy_heal.emit()


func _physics_process(_delta):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("Default")
