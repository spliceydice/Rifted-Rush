extends Area2D

@export var min_speed: float = 250.0
@export var max_speed: float = 400.0

@export var accuracy_radius = 200.0

var spawn_pos: Vector2
var target_pos: Vector2
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	if not Global.tutorial:
		var t = Global.difficulty_t()
		min_speed = min_speed * lerp(1.0, 1.6, t) # SCALE!!!
		max_speed = max_speed * lerp(1.0, 1.6, t) # SCALE!!!
	
	position = spawn_pos
	var random_angle = randf_range(0, 2 * PI)
	var random_distance = randf_range(0, accuracy_radius)
	var offset = Vector2(cos(random_angle), sin(random_angle)) * random_distance
	
	var inaccurate_target = target_pos + offset
	
	var direction = (inaccurate_target - position).normalized()
	var speed = randf_range(min_speed, max_speed)
	velocity = direction * speed
	
	look_at(inaccurate_target)
	
func _physics_process(delta: float) -> void:
	position += velocity * delta
