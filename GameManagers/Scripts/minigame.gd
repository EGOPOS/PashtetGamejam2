extends CanvasLayer

class_name MinigameSingleton

var minigame: MiniGame

func start_minigame(_new_minigame: CanvasLayer) -> void:
	minigame = _new_minigame
	add_child(minigame)

func exit_current_minigame() -> void:
	remove_child(minigame)
