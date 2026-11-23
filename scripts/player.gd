extends CharacterBody2D

@export var speed: float = 200.0

var touch_direction := Vector2.ZERO
var facing := Vector2.DOWN


func set_touch_direction(direction: Vector2) -> void:
	touch_direction = direction


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")
	if touch_direction != Vector2.ZERO:
		direction = touch_direction
	if direction != Vector2.ZERO and direction != facing:
		facing = direction
		queue_redraw()
	velocity = direction * speed
	move_and_slide()


func _draw() -> void:
	draw_circle(Vector2(2, 4), 15, Color("#213335"))
	draw_circle(Vector2.ZERO, 14, Color("#f8ce79"))
	draw_circle(Vector2.ZERO, 9, Color("#ae653f"))
	draw_circle(facing * 9, 4, Color("#fff4cf"))
