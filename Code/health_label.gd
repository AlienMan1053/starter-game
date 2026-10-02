extends Label

func _ready():
	# Connect to GameManager signal
	GameManager.health_changed.connect(_on_health_changed)
	# Initialize label text
	text = "Health: %s" % GameManager.health
	
func _on_health_changed(new_health):
	text = "Health: %s" % new_health
