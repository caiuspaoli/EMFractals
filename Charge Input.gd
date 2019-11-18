extends OptionButton

func _ready():
	add_items()
	
func add_items():
	add_item("3-")
	add_item("2-")
	add_item("1-")
	add_item("0")
	add_item("1+")
	add_item("2+")
	add_item("3+")
	
func _process(delta):
	selected = get_parent().get_parent().bodies[get_parent().get_parent().selected].charge
	
	
