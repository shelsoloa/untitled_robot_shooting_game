extends AStar2D

var _edge_weight = {}


func _compute_cost(from_id, to_id):
	return _edge_weight[from_id][to_id]


func add_point(id: int, position: Vector2, weight_scale : float=1.0) -> void:
	.add_point(id, position, weight_scale)
	_edge_weight[id] = {}


func populate(graph : WeightedDirectedGraph2D, append=false):
	if not append:
		clear()
	
	var nodes = graph.get_graph_nodes()

	for node in nodes:
		add_point(node, node.position)

	for node in nodes:
		for edge in node.neighbours:
			connect_weighted_points(node, edge, false, edge.weight)


func connect_weighted_points(from_id, to_id, bidirectional, weight):
	connect_points(from_id, to_id, bidirectional)
	_edge_weight[from_id][to_id] = weight
