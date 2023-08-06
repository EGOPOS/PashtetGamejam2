extends ClickableObject

func make_effect() -> void:
	get_parent().mob_speed = 0.0

func effect_end() -> void:
	get_parent().mob_speed = 200
	queue_free()
