extends Node
var minigames_done = 0
var lives = 5
var score = 0
var tutorial = true
var last_minigame_picked = 0
var high_score = 0

const DIFFICULTY_MAX_MINIGAME := 25
const STEP_LEVEL := 10
const STEP_JUMP := 0.2
const POINTS_PER_SECOND_LEFT := 200
const SURVIVE_COMPLETION_BONUS := 300
const BASE_POINTS := 100

func add_time_score(time_left: float) -> void:
	var snapped_time = snapped(time_left, 0.5)
	score += int(snapped_time * POINTS_PER_SECOND_LEFT)

func difficulty_t() -> float:
	var level = minigames_done
	if level <= 1:
		return 0.0
		
	var raw_t = float(level - 1) / float(DIFFICULTY_MAX_MINIGAME - 1)
	raw_t = clamp(raw_t, 0.0, 1.0)
	var t = pow(raw_t, 1.8)
	
	if level >= STEP_LEVEL:
		t += STEP_JUMP
	return clamp(t, 0.0, 1.0)
