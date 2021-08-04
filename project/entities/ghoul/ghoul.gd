class_name Ghoul
extends Actor


export(bool) var draw_debug = false

enum State { 
	STATE_ATTACKING,
	STATE_IDLE,
	STATE_JUMPING,
	STATE_WALKING,
}

const MAX_HEALTH = 3

var bounds = {}
var health = MAX_HEALTH
var target = null


func hit(shape_owner_hit_index):
	var shape_owner_hit = shape_owner_get_owner(shape_owner_hit_index)
	if shape_owner_hit == $HeadCollisionShape:
		health = 0
	else:
		health -= 1

	if health <= 0:
		queue_free()


func _draw():
	if draw_debug:
		var c = Color(1, 0, 0)
		draw_line(bounds.topleft, bounds.topright, c)
		draw_line(bounds.topright, bounds.bottomright, c)
		draw_line(bounds.bottomleft, bounds.bottomright, c)
		draw_line(bounds.topleft, bounds.bottomleft, c)


func _find_target():
	var player = get_player()
	if player == null:
		return null
	return player


func _find_path_to_target(target):
	# TODO pathfinding
	return null


func _process(delta):
	# retarget_delay = amount of time between pathfinding updates

	"""
	if not_on_ground:
		if state == jumping:
			# continue moving in jump direction
		else:
			# continue falling
	"""

	# Confirmed that ghoul is on the ground and ready for next move

	# Calculate the next move to take if current target is reached or retarget
	# delay elapsed
	"""
	if target_reached or retarget_delay_elapsed:
		recalculate_path()
	
		if no_path_found:
			return
	"""
	"""
	target = path[0]

	# Change facing to target
	if target.x < x:
		face_direction(LEFT)
	else:
		face_direction(RIGHT)

	# if next step in direction on ground
	if raycast.collides(ground):
		walk towards direction normally
	else
		if target is below
			fall
		else
			jump in direction
			lock retargetting
	"""

	
func _physics_process(delta):
	velocity.x = -10

	move_and_slide(velocity, FLOOR_NORMAL)
	_update_bounds()


func _ready():
	_update_bounds()


func _update_bounds():
	var bb = $IBox/Shape.get_shape().get_extents()
	bounds = {
		left = -bb.x,
		right = bb.x,
		top = -bb.y,
		bottom = bb.y,
		topleft = Vector2(-bb.x, -bb.y),
		topright = Vector2(bb.x, -bb.y),
		bottomleft = Vector2(-bb.x, bb.y),
		bottomright = Vector2(bb.x, bb.y),
	}
