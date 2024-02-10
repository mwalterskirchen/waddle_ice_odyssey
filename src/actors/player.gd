extends CharacterBody2D

@export var speed = 400
var screen_size # Size of the game window.
const GRAVITY = 0.2
const SPEED = 20.0
const JUMP = 25.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2.ZERO 

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	#velocity.y += GRAVITY

	if Input.is_action_just_pressed("move_up"):
		velocity.y -= 25

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
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

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	move_and_slide()
