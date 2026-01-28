extends CharacterBody2D

var max_speed = 200
var last_direction := Vector2(1,0)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * max_speed
	move_and_slide()
	
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
		print(direction)
	else:
		play_idle_animation(last_direction)
		print(direction)

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
	
