extends Node2D
class_name Point

var velocity = Vector2(0, 0)
var exists = true
var colour = Color(0.0, 0.0, 0.0)
var id = 0

func setup(_position):
	position = _position

func _ready():
	pass
	
func move(body, c, i, max_iterations):
	var movement = Vector2(body.position.x - position.x, body.position.y - position.y)
	var d2 = pow(movement.x, 2) + pow(movement.y, 2)
	if (d2 <= pow(body.charge, 2)):
		colour = body.colour
		colour.a = 1.0 - (i / max_iterations * 0.5)
		exists = false
		return 0
	movement *= c / d2
	velocity += movement
	position += velocity
	return 1