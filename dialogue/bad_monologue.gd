extends Dialogue

func play_minigame() -> void:
	Global.transition_to(Global.TRANSITION_TYPES.MINI_GAME, minigame_action)
