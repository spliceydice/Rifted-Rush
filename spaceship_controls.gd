extends Control

var can_fade: bool = false

# Function 1: Your other script calls this to turn on the arrow key tracking
func activate_fade_mode() -> void:
	can_fade = true

# Function 2: Godot runs this automatically to check for keys, but it is locked 
# until your other script runs 'activate_fade_mode()'
func _unhandled_input(event: InputEvent) -> void:
	if not can_fade:
		return
		
	if event is InputEventKey and event.pressed and not event.is_echo():
		if (event.keycode == KEY_UP or 
			event.keycode == KEY_DOWN or 
			event.keycode == KEY_LEFT or 
			event.keycode == KEY_RIGHT):
			# Lock input and start fading right here inline
			can_fade = false 
			var tween = create_tween()
			tween.tween_property(self, "modulate:a", 0.0, 0.5)
			tween.finished.connect(queue_free)
