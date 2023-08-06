extends CanvasLayer

class_name MinigameSingleton

var minigame: MiniGame

func start_minigame(_new_minigame: MiniGame) -> void:
#	get_tree().paused = true
	minigame = _new_minigame
	add_child(minigame)

func exit_current_minigame() -> void:
#	get_tree().paused = false
	remove_child(minigame)
