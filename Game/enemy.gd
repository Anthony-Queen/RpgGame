extends CharacterBody2D
@export var data: Enemy
signal enemy_attack
signal enemy_defend
signal enemy_heal

func _ready():
	add_to_group("enemy")

func decide():
	if data.Health <= 0:
		print("Health is Zero")
		data.is_dead = true
		Globals.currentPlayerState = Globals.PlayerState.Exploring
		Globals.show_battle(Globals.current_enemy_node)
		return
	
	var random = randf()
	if random < data.ProbAtt:
		enemy_attack.emit()
	elif random < data.ProbDef:
		enemy_defend.emit()
	else:
		enemy_heal.emit()

func _physics_process(_delta):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("Default")
