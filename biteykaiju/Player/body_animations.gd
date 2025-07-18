extends Node2D
# BODY ANIMATIONS


# This script handles changing the animations for its corresponding body part

# Variables:
var current_animation := "" # for animation helper function
@onready var body_animations = %BodyAnimations # assigns AnimationPlayer to a variable
@onready var this_node = name # returns name of node


# -----------------------------------

func _ready() -> void:
	# setting up a signal for when an animation finishes
	body_animations.connect("animation_finished", Callable(self, "on_animation_finished"))
	

# HELPER FUNCTION:  swap animation only if it's changed
func change_animation(anim_name: String):
	if current_animation != anim_name: 
		body_animations.play(anim_name)
		current_animation = anim_name
		print_debug(this_node, " is ", current_animation)

# ANIMATION SWITCHING
func play_idle_animation(): 
	change_animation("BODY/idle2")
	

func play_run_animation(): 
	change_animation("BODY/run1")
	

# EXPERIMENTAL:  head rotates to look at mouse...???
# >> Working, but commented out so I can try something else
#func _physics_process(delta: float) -> void:
		# Head looks at mouse
	#%Head_Rotate.look_at(get_global_mouse_position())
		
		
		
		
		
		
		
		
		
		
		
