extends ClickableObject

func make_effect() -> void:
	if get_parent().health_points < 100:
		get_parent().health_points += 50
		get_parent().health_points = clamp(get_parent().health_points, 0, 100)
		get_parent().update_health_points(get_parent().health_points)

func effect_end() -> void:
	pass
