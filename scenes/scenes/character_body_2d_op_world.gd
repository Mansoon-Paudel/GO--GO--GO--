extends CharacterBody2D

const COYOTE_TIME = 0.10
const MAX_JUMPS = 2 
const SPEED = 230.0
const JUMP_VELOCITY = -460.0
@onready var coyote_time: Timer = $"Coyote Time"
@onready var coyote_time_activated: bool = false
@onready var jump_sound: AudioStreamPlayer2D = $"Jump-sound"
@onready var sprite2D = $Sprite2D
var jumps_left = MAX_JUMPS
var coyote_timer = 0.0

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		coyote_timer = COYOTE_TIME  # Reset coyote timer when grounded
		jumps_left = MAX_JUMPS      # Reset jump count

	# Reduce coyote timer when in air
	if not is_on_floor() and coyote_timer > 0.0:
		coyote_timer -= delta

	# Handle jump input
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() or coyote_timer > 0.0 or jumps_left > 0:
			velocity.y = JUMP_VELOCITY
			jump_sound.play()

	
			# Only consume a jump if not on ground
			if not is_on_floor():
				jumps_left -= 1

			coyote_timer = 0.0 # Stop coyote once jump used

	# Horizontal movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 18)

	move_and_slide()

	# Animations
	if is_on_floor():
		if abs(velocity.x) > 1:
			sprite2D.play("run")
		else:
			sprite2D.play("default")
	else:
		sprite2D.play("jump")

	sprite2D.flip_h = velocity.x < 0
