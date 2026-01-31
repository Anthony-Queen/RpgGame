extends CharacterBody2D

enum State { Exploring, Combat }
var currentState = State.Exploring
var max_speed = 200
var last_direction := Vector2(1,0)
var isEnemyDead = false

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * max_speed
	move_and_slide()
	onEnemy()
	if currentState == State.Combat and isEnemyDead:
		exit_combat()
	
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
	else:
		play_idle_animation(last_direction)

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

func enter_combat(enemy):
	currentState = State.Combat
	print("Combat started with " + enemy.name)

func onEnemy():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body.is_in_group("enemy") and currentState != State.Combat:
			enter_combat(body)

func exit_combat():
	if isEnemyDead:
		currentState = State.Exploring
