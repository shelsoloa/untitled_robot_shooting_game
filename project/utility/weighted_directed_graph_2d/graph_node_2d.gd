tool
class_name GraphNode2D
extends Position2D

signal moved

export (Color) var color = Color(0.0, 0.75, 0.0, 0.5)
export(Array, Resource) var neighbours = []

var last_position := Vector2()

func _process(delta):
	if Engine.editor_hint:
		if position.x != last_position.x or position.y != last_position.y:
			emit_signal("moved")
			last_position.x = position.x
			last_position.y = position.y
