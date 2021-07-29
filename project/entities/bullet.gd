extends Area2D

const SPEED = 1500

func _physics_process(delta):
	position += transform.x * SPEED * delta


func _on_Bullet_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.is_in_group("mobs"):
		body.hit(body_shape)
	queue_free()
