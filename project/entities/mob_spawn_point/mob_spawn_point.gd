class_name MobSpawnPoint
extends Position2D

export (PackedScene) var Mob


func spawn_mob():
	var mob = Mob.instance()
	mob.position = global_position
	owner.add_child(mob)


func _on_Timer_timeout():
	spawn_mob()
