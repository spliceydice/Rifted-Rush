extends Path2D

@onready var path_follow: PathFollow2D = $PathFollow2D
@onready var area_2d: Area2D = $PathFollow2D/draggable/Area2D

#sets max distance for mouse where dragging occurs
@export var max_drag_distance: float = 75.0
var is_dragging = false

func _ready() -> void:
	area_2d.input_event.connect(_on_area_2d_input_event)
	
func _process(delta: float) -> void:
	if is_dragging:
		# lets the mouses position be reused
		var mouse_pos = get_global_mouse_position()
		var local_mouse_pos = to_local(mouse_pos)
		#closest point on path calc
		var closest_point = curve.get_closest_point(local_mouse_pos)
		#distance between mouse and point
		var distance_point = local_mouse_pos.distance_to(closest_point)
		#compare distance to max allowed distance
		if distance_point <= max_drag_distance:
			var closest_offset = curve.get_closest_offset(local_mouse_pos)
			path_follow.progress = closest_offset
		else:
			#if mouse exceeds distance parameters dragging stops
			is_dragging = false
func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	#when left click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
		else:
			is_dragging = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if player lets go
		is_dragging = false
