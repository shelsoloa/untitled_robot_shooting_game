tool
class_name WeightedDirectedGraph2D
extends Node2D

export (Color) var color = Color(0.0, 0.75, 0.0, 0.5)

# Array of vertexes
# Each vertex contains an array of edges
# Each edge is a tuple containing vertex, weight
var _graph_nodes = []


func _ready():
	for child in get_children():
		if child is GraphNode2D:
			_graph_nodes.append(child)
			if Engine.editor_hint:
				child.connect("moved", self, "_on_node_moved")


func _draw():
	if Engine.editor_hint:
		for node in _graph_nodes:
			_draw_node(node)
			for edge in node.neighbours:
				_draw_connection(node, edge)


func _draw_connection(node : GraphNode2D, edge : GraphEdge2D):
	var neighbour = node.get_node(edge.neighbour_path)

	var start_pos = node.global_position
	var end_pos = neighbour.global_position

	if start_pos.x < end_pos.x:
		start_pos.y -= 1
		end_pos.y -= 1
	else:
		start_pos.y += 1
		start_pos.y += 1

	var mid_pos = (start_pos + end_pos) / 2
	mid_pos = (start_pos + mid_pos) / 2

	# Draw weight label
	draw_string(_get_font(), mid_pos, str(edge.weight), node.color)

	# Draw connecting line
	draw_line(start_pos, end_pos, node.color, 1.25)


func _draw_node(node : GraphNode2D):
	draw_string(_get_font(), node.global_position, node.name, node.color)


func _gen_pair_hash(node_a, node_b): 
	var hash_a = str(node_a).hash()
	var hash_b = str(node_b).hash()
	
	if hash_a < hash_b:
		return str(hash_a) + ":::" + str(hash_b)
	else:
		return str(hash_b) + ":::" + str(hash_a)


func _get_configuration_warning():
	if _graph_nodes.size() == 0:
		return "WeightedDirectedGraph2D must have at least one configured GraphNode2D"
	return ""


func _get_font():
	var label = Label.new()
	var font = label.get_font("")
	label.free()
	return font


func _on_node_moved():
	update()
