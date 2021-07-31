class_name GraphEdge2D
extends Resource

export(NodePath) var neighbour_path
export(int) var weight

func _get_configuration_warning():
	if neighbour_path == null:
		return "Neighbour must be set for GraphEdge2D"
	if weight == null:
		return "Weight must be set for GraphEdge2D"
	return ""
