extends Node2D

var is_dragging = false
var mouse_offset = Vector2.ZERO

func _process(_delta):
	if is_dragging:
		# sets its own position to the mouses position
		global_position = get_global_mouse_position() + mouse_offset

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# if the left mouse button is clicked
		if event.pressed:
			# when pressed
			is_dragging = true
			mouse_offset = global_position - get_global_mouse_position()
		else:
			is_dragging = false
