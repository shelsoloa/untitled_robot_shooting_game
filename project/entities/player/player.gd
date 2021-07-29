class_name Player
extends Actor

export (PackedScene) var Bullet

const MOVE_SPEED = 300
const JUMP_FORCE = 600


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

	# finalize movement
	move_and_slide(velocity, FLOOR_NORMAL)

	# Gun updates
	$Gun/Muzzle.look_at(get_global_mouse_position())
	update_sight()

	# Shoot
	if Input.is_action_just_pressed('ui_shoot'):
		shoot()

	if is_on_floor() or is_on_ceiling():
		velocity.y = 0

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Gun/Muzzle.global_transform

func update_sight():
	$Gun/Sight.set_point_position(1, get_local_mouse_position())
