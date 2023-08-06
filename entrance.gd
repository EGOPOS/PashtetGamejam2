extends Node2D

@onready var animation_playr = get_node("AnimationPlayer")

func _ready():
	if Global.thunder_time:
		animation_playr.play("thunder")
	else:
		animation_playr.play("RESET")
	$homeless/Camera2D.limit_left = -160
	$homeless/Camera2D.limit_right = 50
