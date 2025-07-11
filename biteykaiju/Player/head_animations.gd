extends Node2D
# HEAD ANIMATIONS 

# This script handles changing the animations for its corresponding body part

# Variables:
var current_animation := "" # for animation helper function
@onready var head_animations = %HeadAnimations # assigns AnimationPlayer to a variable
@onready var this_node = name # returns name of node


# -----------------------------------


	

# HELPER FUNCTION:  swap animation only if it's changed
func change_animation(anim_name: String):
	if current_animation != anim_name: 
		head_animations.play(anim_name)
		current_animation = anim_name
		print_debug(this_node, " is ", current_animation)

# ANIMATION SWITCHING
func play_idle_animation(): 
	change_animation("HEAD/default")
	

func play_grin_animation(): 
	change_animation("HEAD/grin")
	

func play_mlem_animation(): 
	change_animation("HEAD/mlem")
	
	
func play_pant_animation(): 
	change_animation("HEAD/pant")



		
		
		
		
		
		
		
		
		
		
		
