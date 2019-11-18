extends ColorPickerButton

func _ready():
	pass
	
func _process(delta):
	color = get_parent().get_parent().bodies[get_parent().get_parent().selected].colour