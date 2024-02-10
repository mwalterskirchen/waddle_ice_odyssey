extends CharacterBody2D

const GRAVITY = 20.0
const WALK_SPEED = 200
var JUMP_SPEED = -500

func _physics_process(delta):
	#velocity.y += delta * GRAVITY
	velocity.y = velocity.y + GRAVITY

	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("move_up"):
		velocity.y += JUMP_SPEED

	if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
	else:
		$AnimatedSprite2D.animation = "default"

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
