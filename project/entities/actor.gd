class_name Actor
extends KinematicBody2D

const GRAVITY = 33.5
const FLOOR_NORMAL = Vector2(0, -1)
const MAX_GRAVITY = GRAVITY * 30

var facing = Vector2()
var velocity = Vector2()
var _player_ref = null


## Convenience function for getting the Player in the scene. If Player is found,
## this function will cache the instance to avoid running the expensive
## find_node function repeatedly.
func get_player():
	if _player_ref == null:
		_player_ref = get_tree().get_root().find_node("Player")
	return _player_ref


func _physics_process(delta):
	if velocity.y < MAX_GRAVITY:
		velocity.y += GRAVITY
