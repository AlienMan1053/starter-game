extends Node
#Displayed game information
signal score_changed(new_score)
signal combo_changed(new_combo)
signal health_changed(new_health)

#Score trackers
var score = 0
var comboMultipier = 1.0

#Player information
var player_size = 0.25

#Player DEFAULT_SPEED values
var player_speed
const DEFAULT_SPEED = 750.0
const SPEED_DEBUFF = 60.0
const SPEED_BUFF = 40.0

#Player jump values
var player_jump_velocity
const DEFAULT_JUMP = -700.0
const JUMP_DEBUFF = 65.0
const JUMP_BUFF = 45.0

#Sound and world variables
var health = 5
const MAX_HEALTH = 5

enum GAME_STATES {
	MENU,
	PLAYING,
	GAME_OVER,
	PAUSED
}
var _state: GAME_STATES = GAME_STATES.MENU

func _ready() -> void:
	player_speed = DEFAULT_SPEED
	player_jump_velocity = DEFAULT_JUMP

func add_point():
	score += 12*comboMultipier
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	#print(score)

func damage():
	comboMultipier = 1.0
	score -= 10*comboMultipier
	health -= 1
	if health == 0:
		_state = GAME_STATES.GAME_OVER
	
	emit_signal("health_changed", health)
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)

func pause():
	_state = GAME_STATES.PAUSED

func unpause():
	_state = GAME_STATES.PLAYING

func reset():
	score = 0
	comboMultipier = 1.0
	player_size = 0.25
	health = 5
	player_speed = DEFAULT_SPEED
	player_jump_velocity = DEFAULT_JUMP
	_state = GAME_STATES.PLAYING

func _on_button_pressed() -> void:
	%GameOver.hide()
	reset()
	get_tree().reload_current_scene()
