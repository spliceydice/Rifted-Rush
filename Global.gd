extends Node
var minigames_done = 0
var lives = 5
var score = 0
var tutorial = true
var last_minigame_picked = 0
var high_score = 0

const DIFFICULTY_MAX_MINIGAME := 20
const STEP_LEVEL := 7
const STEP_JUMP := 0.3
const START_T := 0.25
const POINTS_PER_SECOND_LEFT := 200
const SURVIVE_COMPLETION_BONUS := 300
const BASE_POINTS := 100

func add_time_score(time_left: float) -> void:
	var snapped_time = snapped(time_left, 0.5)
	score += int(snapped_time * POINTS_PER_SECOND_LEFT)

func difficulty_t() -> float:
	var level = minigames_done
	if level <= 1:
		return START_T
		
	var raw_t = float(level - 1) / float(DIFFICULTY_MAX_MINIGAME - 1)
	raw_t = clamp(raw_t, 0.0, 1.0)
	var eased = pow(raw_t, 1.8)
	var t = lerp(START_T, 1.0, eased)
	
	if level >= STEP_LEVEL:
		t += STEP_JUMP
	return clamp(t, 0.0, 1.0)
