extends CharacterBody2D

class_name Player

var max_speed = 200
var last_direction := Vector2(1,0)
var isEnemyDead = false
var attacks: Array[Attack] = []
const MAX_ATTACKS := 4
signal combat_started(enemy)


func _ready():
	Globals.player = self

func _physics_process(_delta):
	if Globals.currentPlayerState == 0:
		var direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * max_speed
		move_and_slide()
		onEnemy()
		if Globals.currentPlayerState == Globals.PlayerState.Combat and isEnemyDead:
			exit_combat()
	
		if direction.length() > 0:
			last_direction = direction
			play_walk_animation(direction)
		else:
			play_idle_animation(last_direction)

func onEnemy():
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body.is_in_group("enemy") and Globals.currentPlayerState != Globals.PlayerState.Combat:
			Globals.currentPlayerState = Globals.PlayerState.Exploring
			enter_combat(body)

func enter_combat(enemy):
	velocity = Vector2.ZERO
	Globals.currentPlayerState = Globals.PlayerState.Combat

	Globals.current_enemy = enemy.data
	Globals.current_enemy_node = enemy
	
	enemy.get_parent().remove_child(enemy)
	Globals.show_battle(enemy)

func exit_combat():
	if isEnemyDead:
		Globals.currentPlayerState = Globals.PlayerState.Exploring
		$Camera2D.enabled = true

func play_walk_animation(direction):
	if direction.x > 0:
		$AnimatedSprite2D.play("Right")
	elif direction.x < 0:
		$AnimatedSprite2D.play("Left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("Down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("Up")

func play_idle_animation(direction):
	if direction.x > 0:
		$AnimatedSprite2D.play("Idle_Right")
	elif direction.x < 0:
		$AnimatedSprite2D.play("Idle_Left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("Idle_Down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("Idle_Up")
