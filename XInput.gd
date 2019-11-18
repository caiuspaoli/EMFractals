extends SpinBox

func _ready():
	pass
	
func _process(delta):
	value = get_parent().get_parent().bodies[get_parent().get_parent().selected].position[0]