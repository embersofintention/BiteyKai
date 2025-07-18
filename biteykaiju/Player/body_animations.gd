extends Node2D
# BODY ANIMATIONS


# This script handles changing the animations for its corresponding body part

# Variables:
var current_animation := "" # for animation helper function
var mouse_pos
var head_bone

@onready var body_animations = %BodyAnimations # assigns AnimationPlayer to a variable
@onready var this_node = name # returns name of node


# -----------------------------------

func _ready() -> void:
	# setting up a signal for when an animation finishes
	body_animations.connect("animation_finished", Callable(self, "on_animation_finished"))
	
	# allow us to control %Head_Rotate from our code
	head_bone = %Head_Rotate
	head_bone.set_process_internal(true) # ensures manual control
	

# HELPER FUNCTION:  swap animation only if it's changed
func change_animation(anim_name: String):
	if current_animation != anim_name: 
		body_animations.play(anim_name)
		current_animation = anim_name
		#print_debug(this_node, " is ", current_animation)

# ANIMATION SWITCHING
func play_idle_animation(): 
	change_animation("BODY/idle2")
	

func play_run_animation(): 
	change_animation("BODY/run1")
	

# EXPERIMENTAL:  head rotates to look at mouse...???

func _physics_process(delta: float) -> void:
		# Head looks at mouse
		# >> Working, but commented out so I can try something else
	#%Head_Rotate.look_at(get_global_mouse_position())
	
	# head faces direction (experiment)

	mouse_pos = get_global_mouse_position() # easier way to reference mouse position
	var cursor_angle = (mouse_pos - head_bone.global_position).angle()
	#print_debug(cursor_angle)
	
	
	#%Head_Rotate.look_at(abs(cursor_angle))
	print_debug("cursor angle = ", cursor_angle)
	

	

		
		
		
		
		
		
		
		
		
		
