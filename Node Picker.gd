extends OptionButton

var Body = preload("res://Body.tscn")
var bodies = []

func _ready():
	var new_body = Body.instance()
	new_body.setup(Vector2(600, 400), 1, Color(0.0, 0.0, 0.0), 1)
	get_tree().get_nodes_in_group("fractal_window")[0].add_child(new_body)
	bodies.append(new_body)
	add_item("Node " + str(new_body.ID))

func _on_Add_Node_pressed():
	var new_body = Body.instance()
	new_body.setup(Vector2(600, 600), 1, Color(0.0, 0.0, 0.0), get_item_count() + 1)
	get_tree().get_nodes_in_group("fractal_window")[0].add_child(new_body)
	bodies.append(new_body)
	add_item("Node " + str(get_item_count() + 1))
	selected = get_item_count() - 1

func _on_Delete_Node_pressed():
	if get_item_count() > 1:
		for i in range(get_item_count() - get_selected_id()):
			set_item_text(i + selected, "Node " + str(i + selected))
		var temp = selected
		selected -= 1
		remove_item(temp)
		bodies[temp].queue_free()
		bodies.erase(temp)
		
		
func _on_XInput_value_changed(value):
	bodies[selected].position[0] = value

func _on_YInput_value_changed(value):
	bodies[selected].position[1] = value

func _on_ColourInput_color_changed(color):
	bodies[selected].colour = color
	bodies[selected].update()

func _on_ChargeInput_item_selected(ID):
	bodies[selected].charge = ID
	bodies[selected].update()
