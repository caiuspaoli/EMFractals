extends Button

var show_menu = false;

func _ready():
	for button in get_tree().get_nodes_in_group("file_buttons"):
		button.connect("mouse_entered", self, "mouse_entered_button", [button])
		button.connect("mouse_exited", self, "mouse_exited_button", [button])
		
	connect("mouse_entered", self, "mouse_entered_button", [self])
	connect("mouse_exited", self, "mouse_exited_button", [self])
		
func mouse_entered_button(button):
	show_menu = true
	pass
	
func mouse_exited_button(button):
	show_menu = false
	pass
	
func _process(delta):
	for button in get_tree().get_nodes_in_group("file_buttons"):
		if(show_menu):
			button.show()
		else:
			button.hide()
