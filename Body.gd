extends Sprite
class_name Body

export var charge = 1
export var colour = Color(1.0, 0.0, 0.0)
export var id = 0

func setup(_position, _charge, _colour, _id):
	position = _position
	charge = _charge
	colour = _colour
	id = _id
	add_to_group("active_bodies")
	print(position)
	
func _ready():
	pass

func _draw():
	draw_circle(Vector2(0, 0), abs(charge) * 4, colour)