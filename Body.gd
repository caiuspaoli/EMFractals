extends Node2D

class_name Body
var ID = 1
var charge = 1
var colour = Color(0.0, 0.0, 0.0)
var event = Input

func setup(_position, _charge, _colour, _ID):
		position = _position
		charge = _charge
		colour = _colour
		ID = _ID
		
func _ready():
	add_to_group("active_bodies")
	
func _draw():
	draw_circle(Vector2(0, 0), charge * 3 + 15, colour)
	
func _process(delta):
	if mouse_over() and event.is_action_just_released("mouse_down"):
		emit_signal("body_clicked")
	
func mouse_over():
	var mouse_position = get_viewport().get_mouse_position()
	if (pow(position[0] - mouse_position[0], 2) + pow(position[1] - mouse_position[1] + 30, 2) < pow(charge * 3 + 15, 2)):
		return true
	return false
	

	