extends Node2D

@export var fireball_scene: PackedScene = preload("res://spamball.tscn")

func _on_timer_timeout() -> void:
	if not fireball_scene:
		return
	var screen_size = get_viewport().get_visible_rect().size
	var edge: int
	var roll = randf()
	if roll < 0.33:
		edge = 0 # top - 33% of spawns
	elif roll < 0.49:
		edge = 1 # left - 16%
	elif roll < 0.65:
		edge = 2 # right - 16%
	else:
		edge = 3 # bottom - 35% 
	var spawn_position = Vector2.ZERO
	var padding = 150.0
	
	match edge:
		0:
			spawn_position.x = randf_range(-padding, screen_size.x + padding)
			spawn_position.y = -padding
		1:
			spawn_position.x = -padding
			spawn_position.y = randf_range(-padding, screen_size.y)
		2: 
			spawn_position.x = screen_size.x + padding
			spawn_position.y = randf_range(-padding, screen_size.y)
		3:
			spawn_position.x = randf_range(-padding, screen_size.x + padding)
			spawn_position.y = screen_size.y + padding
			
	var center_position = Vector2(screen_size.x / 2.0, screen_size.y / 2.0)
	
	var fireball_instance = fireball_scene.instantiate()
	fireball_instance.spawn_pos = spawn_position
	fireball_instance.target_pos = center_position
	
	get_parent().add_child(fireball_instance)
