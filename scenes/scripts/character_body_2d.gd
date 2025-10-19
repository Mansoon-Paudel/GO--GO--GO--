extends CharacterBody2D

const SPEED = 230.0
const JUMP_VELOCITY = -460.0
const COYOTE_TIME = 0.13

@onready var jump_sound: AudioStreamPlayer2D = $"Jump-sound"
@onready var sprite2D = $Sprite2D

var coyote_timer = 0.0

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		coyote_timer = COYOTE_TIME

	

	# Handle jump input
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() or coyote_timer > 0.0:
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
			coyote_timer = 0.0

	# Horizontal movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 18)

	move_and_slide()

	if is_on_floor():
		if velocity.x>1 or velocity.x < -1:
			sprite2D.play("run")
		else:
			sprite2D.play("default")
	else:
		sprite2D.play("jump")

	sprite2D.flip_h = velocity.x < 0
