extends CharacterBody2D

@export var speed: float = 675.0

@export var texture_up: Texture2D
@export var texture_down: Texture2D
@export var texture_left: Texture2D
@export var texture_right: Texture2D

signal player_area_entered(area)

@onready var sprite = $Sprite2D
@onready var interaction_area = $Area2D

func _ready():
	interaction_area.area_entered.connect(_on_area_2d_area_entered)

func _on_area_2d_area_entered(other_area):
	player_area_entered.emit(other_area)

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	
	if direction != Vector2.ZERO:
		if abs(direction.x) >= abs(direction.y):
			if direction.x > 0 and texture_right:
				sprite.texture = texture_right
			elif direction.x < 0 and texture_left:
				sprite.texture = texture_left
		else:
			if direction.y > 0 and texture_down:
				sprite.texture = texture_down
			elif direction.y < 0 and texture_up:
				sprite.texture = texture_up
