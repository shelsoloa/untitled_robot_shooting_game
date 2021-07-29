class_name Zombie
extends Actor

const MAX_HEALTH = 3
var health = MAX_HEALTH

func hit(shape_owner_hit_index):
	var shape_owner_hit = shape_owner_get_owner(shape_owner_hit_index)
	if shape_owner_hit == $HeadCollisionShape:
		health = 0
	else:
		health -= 1

	if health <= 0:
		queue_free()

func _physics_process(delta):
	# finalize movement
	move_and_slide(velocity, FLOOR_NORMAL)

