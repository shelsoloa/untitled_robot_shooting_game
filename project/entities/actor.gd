class_name Actor
extends KinematicBody2D

const GRAVITY = 33.5
const FLOOR_NORMAL = Vector2(0, -1)
const MAX_GRAVITY = GRAVITY * 30

var facing = Vector2()
var velocity = Vector2()

func _physics_process(delta):
	if velocity.y < MAX_GRAVITY:
		velocity.y += GRAVITY
