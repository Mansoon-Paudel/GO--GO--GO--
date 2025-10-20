extends CharacterBody2D

const COYOTE_TIME = 0.10
const SPEED = 230.0
const JUMP_VELOCITY = -460.0
@onready var game_manager: Node = %GameManager
@onready var coyote_time: Timer = $"Coyote Time"
@onready var coyote_time_activated: bool = false
@onready var jump_sound: AudioStreamPlayer2D = $"Jump-sound"
@onready var sprite2D = $Sprite2D
@onready var left_jump: CPUParticles2D = $"Left jump"
@onready var right_jump: CPUParticles2D = $"Right jump"


var max_jumps=1
var jumps_left=1
var coyote_timer=0.0
var is_left=velocity.x<0

func _physics_process(delta: float) -> void:
	if game_manager.points >= 30:
		max_jumps = 2
	elif game_manager.points>= 5:
		max_jumps = 1
	elif game_manager.points<=4:
		max_jumps = 0


	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		coyote_timer = COYOTE_TIME  
		jumps_left = max_jumps  


	# Handle jump input
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() or coyote_timer > 0.0 or jumps_left > 0:
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
			if velocity.x>0:
				right_jump.emitting=true
			elif velocity.x<0:
				left_jump.emitting=true

			if not is_on_floor():
				jumps_left -= 1

			coyote_timer = 0.0 

	# Horizontal movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 18)

	move_and_slide()

	# Animations
	if is_on_floor():
		if velocity.x > 1 or velocity.x < -1:
			sprite2D.play("run")
		else:
			sprite2D.play("default")
	else:
		sprite2D.play("jump")

	sprite2D.flip_h = velocity.x < 0
