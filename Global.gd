extends Node
var minigames_done = 0
var lives = 5
var score = 0
var tutorial = true
var last_minigame_picked = 0

const DIFFICULTY_MAX_MINIGAME := 35

func difficulty_t() -> float:
	var raw_t = float(minigames_done - 1) / float(DIFFICULTY_MAX_MINIGAME - 1)
	raw_t = clamp(raw_t, 0.0, 1.0)
	return pow(raw_t, 1.3)
