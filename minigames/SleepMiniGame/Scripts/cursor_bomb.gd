extends ClickableObject

func make_effect() -> void:
	get_parent().cursor_damage *= 2
	change_explosion_sprite_size(2)

func effect_end() -> void:
	get_parent().cursor_damage /= 2
	change_explosion_sprite_size(1)
	queue_free()

func change_explosion_sprite_size(_scale: float) -> void:
	get_parent().mob_prop_scale = _scale
