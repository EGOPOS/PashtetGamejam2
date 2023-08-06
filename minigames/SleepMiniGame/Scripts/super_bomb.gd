extends ClickableObject

func make_effect() -> void:
	for mob in get_parent().get_children():
		if mob is SleepMob:
			mob._take_damage(mob.health_points)
	queue_free()
