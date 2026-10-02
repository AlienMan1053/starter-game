extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect to GameManager signal
	GameManager.health_changed.connect(_on_health_changed)
	# Initialize health
	max_value = GameManager.MAX_HEALTH
	value = GameManager.health


func _on_health_changed(new_health):
	value = GameManager.health
