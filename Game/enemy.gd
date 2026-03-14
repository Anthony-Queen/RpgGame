extends CharacterBody2D
@export var data: Enemy
signal enemy_attack
signal enemy_defend
signal enemy_heal


func _ready():
	add_to_group("enemy")
	Battle.EnemyTurn.connect(decide)

func decide():
	if data.Health <= 0:
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
