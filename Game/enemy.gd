extends CharacterBody2D
@export var data: Enemy
signal enemy_attack
signal enemy_defend
signal enemy_heal
signal death

func _ready():
	add_to_group("enemy")
	#Battle.EnemyTurn.connect(decide)

func decide():
	if data.Health <= 0:
		print("Health is Zero")
		Globals.currentPlayerState = Globals.PlayerState.Exploring
		Globals.show_battle(Globals.current_enemy_node)
		death.emit()
		return
	
	var random = randf()
	print(random)
	if random < 0.55:
		enemy_attack.emit()
	elif random < 0.85:
		enemy_defend.emit()
	else:
		enemy_heal.emit()


func _physics_process(_delta):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("Default")
