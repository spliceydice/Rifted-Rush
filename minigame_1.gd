extends Node2D
@onready var minigame_timer: Node2D = $minigame_timer 
# ^^^ You dragged this in the scene by the way 





var garlic_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:

		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


	await minigame_timer.Timer(6) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	
	if garlic_collected == 3:
			get_tree().change_scene_to_file("res://timer_screen.tscn") # go back to the intermission scene
			return
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://death_screen.tscn") # lose ur lives
			return
		else:
			get_tree().change_scene_to_file("res://timer_screen.tscn") # back to intermission
			return

func garlic_collect() -> void: # cool function that you connect to those garlics
	garlic_collected = garlic_collected +1
	return
