extends KinematicBody2D

const GRAVITY = 33.5
const FLOOR_NORMAL = Vector2(0, -1)
const MAX_GRAVITY = GRAVITY * 30

const MOVE_SPEED = 180
const JUMP_FORCE = 450

var facing = Vector2()
var velocity = Vector2()

func _physics_process(delta):
	var keydown_left = Input.is_action_pressed('ui_left')
	var keydown_right = Input.is_action_pressed('ui_right')
	var keydown_jump = Input.is_action_pressed('ui_jump')

	var keypressed_jump = Input.is_action_just_pressed('ui_jump')
	var keyreleased_jump = Input.is_action_just_released('ui_jump')

	if keydown_left == keydown_right:
		velocity.x = 0
	else:
		if keydown_left:
			velocity.x = -MOVE_SPEED
		if keydown_right:
			velocity.x = MOVE_SPEED

	# Jump
	if is_on_floor() and keypressed_jump:
		velocity.y = -JUMP_FORCE
	if keyreleased_jump and velocity.y < 0:
		velocity.y = velocity.y / 3

	# apply gravity
	if velocity.y < MAX_GRAVITY:
		velocity.y += GRAVITY
	
	# finalize movement
	move_and_slide(velocity, FLOOR_NORMAL)

	if is_on_floor() or is_on_ceiling():
		velocity.y = 0
