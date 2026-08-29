extends Node2D
@onready var garlic_container: HBoxContainer = $GarlicContainer
@onready var garlic: TextureRect = $GarlicContainer/Garlic
@onready var garlic_2: TextureRect = $GarlicContainer/Garlic2
@onready var garlic_3: TextureRect = $GarlicContainer/Garlic3
@onready var garlic_4: TextureRect = $GarlicContainer/Garlic4
@onready var garlic_5: TextureRect = $GarlicContainer/Garlic5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer
@onready var score_label: RichTextLabel = $Score
var time
var minigame_picked

func _ready() -> void: 
	$RichTextLabel.visible = false
	if Global.tutorial:
		if Global.minigames_done == 0:
			$Container.activate_fade_mode()
		else:
			$Container.visible = false
		await Timer(1.0) # using the function created
		if Global.minigames_done < 4: # if you havent completed 3 minigames yet 
			Global.minigames_done = Global.minigames_done +1
			get_tree().change_scene_to_file("res://minigame_" + str(Global.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path. 
# Above, your script is being told to go to the next minigame. If the
# current minigame is Level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. Make sure you name your minigame saves appropriately.
		else:
			get_tree().change_scene_to_file("res://done_screen.tscn") # changes your scene
	else:
		$Container.visible = false
		Global.minigames_done = Global.minigames_done + 1
		var options = [1, 2, 3, 4]
		options.erase(Global.last_minigame_picked)
		minigame_picked = options[randi() % options.size()]
		Global.last_minigame_picked = minigame_picked
		if Global.minigames_done == 7:
			$RichTextLabel.visible = true
			$RichTextLabel.activate_fade_mode()
		if Global.minigames_done >= 7:
			$ScrollingBackgrund/Background.texture = load("res://space-backgrounds 1080p/Space BG_1-4_1920x1080.png")
			$ScrollingBackgrund.autoscroll.x *= 2.5
			await Timer(0.6)
		else:
			await Timer(1.0)
		get_tree().change_scene_to_file("res://minigame_" + str(minigame_picked) + ".tscn")

func _process(delta: float) -> void: # runs EVERY FRAME
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.
		4:
			garlic.hide()
		3:
			garlic.hide()
			garlic_2.hide()
		2:
			garlic.hide()
			garlic_2.hide()
			garlic_3.hide()
		1:
			garlic.hide()
			garlic_2.hide()
			garlic_3.hide()
			garlic_4.hide()
		0:
			garlic_container.hide() # just hides everything
	
	timer.text = str(time) # make ths text reflect the value of the time variable. this makes names easier. the str() converts the int to a String
	score_label.text = "Score:" + str(Global.score)
	if Global.tutorial:
		level.text = "Level " + str(Global.minigames_done + 1) # this tells you want minigame you're on using concatenation (google the word yo)
	else:
		level.text = "Level " + str(Global.minigames_done)
func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the scrpit to wait for the function to complete before progressing
		time -= 0.1 # remove 0.1
		# progressively get the value smaller and smaller
	
	#when timer reaches 0
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait, dw abt this being complex '''
