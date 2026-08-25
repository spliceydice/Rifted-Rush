extends Node2D
@onready var minigame_timer: Node2D = $minigame_timer

var buttons_pressed = 0
var timer_end = false

func _ready() -> void:
	$RichTextLabel.activate_fade_mode()
	if Global.tutorial:
		await minigame_timer.Timer(3)
	else:
		randomize_buttons()
		var t = Global.difficulty_t()
		await minigame_timer.Timer(lerp(3.0, 1.6, t)) # SCALE!!!
	#after this is completed...
	timer_end = true 

func randomize_buttons() -> void:
	var buttons = [$Button_1, $Button_2, $Button_3, $Button_4]
	var placed_rects: Array[Rect2] = []
	var screen_size = Vector2(1152, 648)
	
	for button in buttons:
		var button_size = button.size
		var new_pos = Vector2.ZERO
		var attempts = 0
		var valid = false
		
		while attempts < 30 and not valid:
			new_pos = Vector2(
				randf_range(0, screen_size.x - button_size.x),
				randf_range(0, screen_size.y - button_size.y)
			)
			var new_rect = Rect2(new_pos, button_size)
			valid = true
			for rect in placed_rects:
				valid = false
				break
			attempts += 1
			
		button.position = new_pos
		placed_rects.append(Rect2(new_pos, button_size))

func _process(delta: float) -> void:
	if buttons_pressed == 4:
		Global.add_time_score(minigame_timer.time)
		Global.score += Global.BASE_POINTS
		get_tree().change_scene_to_file("res://timer_screen.tscn")
		return
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		if Global.lives == 0:
			if Global.tutorial:
				get_tree().change_scene_to_file("res://death_screen.tscn")
				return
			else:
				get_tree().change_scene_to_file("res://end_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://timer_screen.tscn")
			return
	
