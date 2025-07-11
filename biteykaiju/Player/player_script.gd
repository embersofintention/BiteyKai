extends CharacterBody2D

# variables 
var player_scale = 1

# constants
const SPEED = 600

# variables to call our part collection scenes
@onready var body = %parts_body
@onready var head = %parts_head

# -------------------------------------------

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
			
	
	
	# Animations
	
	
	
	
	# apply movement
	move_and_slide()
