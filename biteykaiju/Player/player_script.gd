extends CharacterBody2D

# Config variables
var player_scale := 1
var head_rotate_correction := deg_to_rad(90) # e.g. for upward-forward bones
var clamp_amount := deg_to_rad(60)

# Game object references
var head_bone # the bone we rotate
@onready var body = %parts_body

# Working variables (not needed outside _physics_process)
var mouse_pos
var head_pos

const SPEED = 600

func _ready() -> void:
	# Access head bone via your body scene's variable
	head_bone = body.head_rotate
	# Make sure we have manual control of the bone
	

func _physics_process(delta: float) -> void:
	# Input & movement
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	
	# Character flipping
	if direction:
		if velocity.x != 0 and velocity.y == 0: 
			body.scale.x = direction.x * player_scale
		if velocity.y: 
			body.scale.y = player_scale
	
	# Animate body
	if velocity.length() > 0.0: 
		body.play_run_animation()
	else:
		body.play_idle_animation()

	# ---------------------------------------
	# HEAD TRACK/FLIP LOGIC (core section)
	# ---------------------------------------
	mouse_pos = get_global_mouse_position()
	head_pos = head_bone.global_position
	var dir = mouse_pos - head_pos

	# Default head scale.y to 1 to avoid "squishing" when parent is scaled
	head_bone.scale.y = 1

	if dir.x >= 0:
		# Mouse is right: face right
		#body.scale.x = abs(body.scale.x)
		head_bone.scale.x = 1
		var cursor_angle = head_rotate_correction + dir.angle()
		var clamped_angle = clamp(cursor_angle, head_rotate_correction - clamp_amount, head_rotate_correction + clamp_amount)
		head_bone.rotation = clamped_angle
		
	else:
		# Mouse is left: face left/flip!
		#body.scale.x = -abs(body.scale.x)
		head_bone.scale.x = 1
		# Mirror the mouse X for symmetrical clamping
		var flipped_mouse = Vector2(2 * head_pos.x - mouse_pos.x, mouse_pos.y)
		var cursor_angle = head_rotate_correction + (flipped_mouse - head_pos).angle()
		var clamped_angle = clamp(cursor_angle, head_rotate_correction - clamp_amount, head_rotate_correction + clamp_amount)
		head_bone.rotation = clamped_angle
		

	# ---------------------------------------
	
	move_and_slide()
	
