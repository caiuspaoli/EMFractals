extends Label

func _ready():
	pass
	
func _process(delta):
	set_text(str(get_parent().ID))
