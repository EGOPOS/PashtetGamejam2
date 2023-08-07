extends AnimationPlayer

func _on_animation_finished(_self):
	get_tree().change_scene_to_file("res://shitBoot/menu_seq/PLAYABLE/SPLASH_TEAM.tscn")
	pass
