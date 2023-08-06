extends CanvasLayer

class_name MiniGame

@export var have_started_monologue: bool = false
@export var started_monologue: Global.MONOLOGUES

signal minigame_ended

func _ready():
	if have_started_monologue:
		Global.transition_to(Global.TRANSITION_TYPES.MONOLOGUE, started_monologue)
