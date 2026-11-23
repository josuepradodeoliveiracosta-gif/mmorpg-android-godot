extends Control

signal direction_changed(direction: Vector2)

const DEAD_ZONE := 16.0

var active_finger := -1
var direction := Vector2.ZERO


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var point: Vector2 = get_global_transform_with_canvas().affine_inverse() * event.position
		if event.pressed and active_finger == -1 and point.distance_to(size * 0.5) <= size.x * 0.5:
			active_finger = event.index
			_update_direction(point)
			get_viewport().set_input_as_handled()
		elif not event.pressed and event.index == active_finger:
			_reset()
			get_viewport().set_input_as_handled()
	elif event is InputEventScreenDrag and event.index == active_finger:
		_update_direction(get_global_transform_with_canvas().affine_inverse() * event.position)
		get_viewport().set_input_as_handled()


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
		_reset()


func _reset() -> void:
	active_finger = -1
	_set_direction(Vector2.ZERO)


func _update_direction(point: Vector2) -> void:
	var offset := point - size * 0.5
	if offset.length() < DEAD_ZONE:
		_set_direction(Vector2.ZERO)
	else:
		var angle := snappedf(offset.angle(), TAU / 8.0)
		_set_direction(Vector2.from_angle(angle).round().normalized())


func _set_direction(value: Vector2) -> void:
	if direction != value:
		direction = value
		direction_changed.emit(direction)
		queue_redraw()


func _draw() -> void:
	var center := size * 0.5
	draw_circle(center, size.x * 0.5 - 1, Color("#162b31df"))
	draw_arc(center, size.x * 0.5 - 2, 0, TAU, 64, Color("#9cb5a5"), 2, true)
	for step in range(8):
		var axis := Vector2.from_angle(step * TAU / 8.0)
		draw_circle(center + axis * 47, 4, Color("#bcd0c0"))
	draw_circle(center + direction * 34, 18, Color("#ecc778"))
