extends Node2D

@onready var animation_playr = get_node("AnimationPlayer")

func _ready():
	if Global.thunder_time:
		animation_playr.play("thunder")
	else:
		animation_playr.play("RESET")
