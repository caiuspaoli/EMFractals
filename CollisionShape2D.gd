extends CollisionShape2D

func _ready():
	pass

func _process(delta):
	shape.radius = get_parent().charge * 3 + 15

