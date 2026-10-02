extends Label

func _ready():
	GameManager.combo_changed.connect(_on_combo_changed)
	
func _on_combo_changed(new_score):
	text = str(new_score)
	
