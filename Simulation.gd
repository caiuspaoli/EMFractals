extends Sprite
class_name Simulation

const Point = preload("res://Point.tscn")
const Body = preload("res://Body.tscn")

export var c = 5
export var max_iterations = 50
var i = 0

var particles = []
var dimensions = Vector2(200, 200)
var img = Image.new()
var tex = ImageTexture.new()

func create_map(w, h):
	var map = []
	for x in range(w):
		map.append([])
		map[x].resize(h)
		for y in range(h):
			var new_point = Point.instance()
			new_point.setup(Vector2(x, y))
			add_child(new_point)
			map[x][y] = new_point
	return map

func _ready():
	particles = create_map(dimensions.x, dimensions.y)
	
	img.create(dimensions.x, dimensions.y, false, Image.FORMAT_RGBA8)
	img.lock()
	tex.create(dimensions.x, dimensions.y, Image.FORMAT_RGBA8)
	
	var new_body = Body.instance()
	new_body.setup(Vector2(dimensions.x / 3 * 2, dimensions.y / 3 * 2), 2, Color(1.0, 0.2, 0.4), 1)
	add_child(new_body)
	
	new_body = Body.instance()
	new_body.setup(Vector2(dimensions.x / 3, dimensions.y / 3), 2, Color(0.8, 0.2, 0.6), 2)
	add_child(new_body)
	
	new_body = Body.instance()
	new_body.setup(Vector2(dimensions.x / 3, dimensions.y / 3 * 2), 2, Color(0.6, 0.2, 0.8), 3)
	add_child(new_body)
	
	#new_body = Body.instance()
	#new_body.setup(Vector2(dimensions.x / 3 * 2, dimensions.y / 3), 2, Color(0.4, 0.2, 1.0))
	#add_child(new_body)
	
func _process(delta):
	update()
	
func _draw():
	if i < max_iterations:
		var bodies = get_tree().get_nodes_in_group("active_bodies")
		for x in range(dimensions.x):
			for y in range(dimensions.y):
				if particles[x][y].exists:
					for body in bodies:
						if (particles[x][y].move(body, c, i, max_iterations) == 0):
							img.set_pixel(x, y, particles[x][y].colour)

	i += 1
	if (i % 2 == 0):
		tex.set_data(img)
		set_texture(tex)