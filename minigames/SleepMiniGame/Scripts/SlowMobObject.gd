extends ClickableObject

func make_effect() -> void:
	Audio.current_music.pitch_scale = 0.7
	get_parent().mob_speed /= 2
	
func effect_end() -> void:
	Audio.current_music.pitch_scale = 1.0
	get_parent().mob_speed *= 2
