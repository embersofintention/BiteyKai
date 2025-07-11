extends Node2D
# HEAD ANIMATIONS 

# This script handles changing the animations for its corresponding body part

# Variables:
var current_animation := "" # for animation helper function
@onready var head_animations = %HeadAnimations # assigns AnimationPlayer to a variable


# -----------------------------------

func _ready() -> void:
	# setting up a signal for when an animation finishes
	head_animations.connect("animation_finished", Callable(self, "on_animation_finished"))
	

# HELPER FUNCTION:  swap animation only if it's changed
func change_animation(anim_name: String):
	if current_animation != anim_name: 
		head_animations.play(anim_name)
		current_animation = anim_name

# ANIMATION SWITCHING
func play_idle_animation(): 
	change_animation("HEAD/default")
	print_debug("head is default")

func play_grin_animation(): 
	change_animation("HEAD/grin")
	print_debug("head is grin")

func play_mlem_animation(): 
	change_animation("HEAD/mlem")
	print_debug("head is mlem")
	
func play_pant_animation(): 
	change_animation("HEAD/pant")
	print_debug("head is pant")


		
		
		
		
		
		
		
		
		
		
		
