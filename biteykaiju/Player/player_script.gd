extends CharacterBody2D

# variables 
var player_scale = 1
var mouse_pos
var head_bone # the bone we gotta rotate
var head_rotate_correction = deg_to_rad(90) # corrects bone angle offset
var clamp_amount = deg_to_rad(60) # how much to clamp head rotation

# constants
const SPEED = 600

# variables to call our part collection scenes
@onready var body = %parts_body
#@onready var head = %Head_Rotate
# onready var head = %parts_head #UNUSED

# -------------------------------------------

func _ready() -> void:
	#set variable to access %Head_Rotate (referencing a variable in the body script)
	head_bone = body.head_rotate
	# allow us to control %Head_Rotate from our code
	head_bone.set_process_internal(true) # ensures manual control

func _physics_process(delta: float) -> void:
	
	# get direction based on player input
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# set player velocity
	velocity = direction * SPEED
	
	# character faces direction 
	if direction:
		# if moving horizontally:
		if velocity.x != 0 and velocity.y == 0: 
			# face the appropriate direction
			body.scale.x = direction.x * player_scale
		# and to avoid scale.y breaking:
		if velocity.y: 
			body.scale.y = player_scale
	

			
	
	
	# ANIMATIONS
	
	# Body Animations
	if velocity.length() > 0.0: 
		body.play_run_animation()
		
	if velocity.length() == 0.0: 
		body.play_idle_animation()
	

	# HEAD FOLLOWS MOUSE (wip)
	
	# easier way to reference mouse position
	mouse_pos = get_global_mouse_position() 
	# determines angle from position to cursor
	var cursor_angle = head_rotate_correction + (mouse_pos - head_bone.global_position).angle()
	# create clamped angle so it doesn't flip
	#var clamped_angle = clamp(cursor_angle, (-clamp_amount), (clamp_amount))
	var clamped_angle = clamp(cursor_angle, (head_rotate_correction - clamp_amount), (head_rotate_correction + clamp_amount))
	
	#Apply rotation logic
	head_bone.rotation = clamped_angle
	#print_debug(cursor_angle)


	
	
	# apply movement
	move_and_slide()
