extends Label

func _ready():
	# Connect to GameManager signal
	GameManager.item_changed.connect(on_item_changed)
	# Initialize label text
	text = "Item: %s" % GameManager.item
	
func on_item_changed(new_item):
	text = "Item: %s" % new_item
