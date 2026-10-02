extends ColorRect
signal startGame
signal exitGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_start_game_button_pressed() -> void:
	emit_signal("startGame")
	%ScoreLabel.show()
	%ComboLabel.show()
	%ScoreText.show()
	%ComboText.show()
	%HealthLabel.show()
	%HealthText.show()
	GameManager.reset()

func _on_exit_game_button_pressed() -> void:
	emit_signal("exitGame")
