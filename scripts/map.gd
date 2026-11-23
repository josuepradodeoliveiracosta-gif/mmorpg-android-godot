extends Node2D

const FIELD := Rect2(28, 28, 904, 484)
const POND := Rect2(672, 94, 190, 116)


func _ready() -> void:
	var walls := StaticBody2D.new()
	add_child(walls)
	_add_wall(walls, Rect2(FIELD.position - Vector2(16, 16), Vector2(FIELD.size.x + 32, 16)))
	_add_wall(walls, Rect2(Vector2(FIELD.position.x - 16, FIELD.end.y), Vector2(FIELD.size.x + 32, 16)))
	_add_wall(walls, Rect2(FIELD.position - Vector2(16, 0), Vector2(16, FIELD.size.y)))
	_add_wall(walls, Rect2(Vector2(FIELD.end.x, FIELD.position.y), Vector2(16, FIELD.size.y)))
	_add_wall(walls, POND)


func _add_wall(body: StaticBody2D, bounds: Rect2) -> void:
	var shape := RectangleShape2D.new()
	shape.size = bounds.size
	var collider := CollisionShape2D.new()
	collider.shape = shape
	collider.position = bounds.get_center()
	body.add_child(collider)


func _draw() -> void:
	draw_rect(FIELD.grow(3), Color("#547a66"))
	draw_rect(FIELD, Color("#294a40"))
	for x in range(48, 932, 32):
		for y in range(48, 512, 32):
			if (x + y * 3) % 5 == 0:
				draw_line(Vector2(x, y), Vector2(x + 4, y - 5), Color("#426554"), 2)
	draw_rect(Rect2(28, 240, 904, 60), Color("#806d50"))
	draw_rect(Rect2(446, 300, 68, 212), Color("#806d50"))
	draw_rect(Rect2(446, 240, 68, 60), Color("#8e7a57"))
	draw_rect(POND.grow(5), Color("#7a946a"))
	draw_rect(POND, Color("#32676c"))
	for x in range(695, 840, 38):
		draw_line(Vector2(x, 128), Vector2(x + 18, 128), Color("#59999a"), 2)
		draw_line(Vector2(x + 8, 168), Vector2(x + 25, 168), Color("#59999a"), 2)
