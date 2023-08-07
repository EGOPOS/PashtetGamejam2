extends Node2D

@onready var animation_playr = get_node("AnimationPlayer")

func _ready():
	if !Audio.current_music.playing:
		Audio.change_current_music(Audio.AUDIO.MAIN_SCENE_MUSIC)
#	if Global.thunder_time:
#		animation_playr.play("thunder")
#	else:
#		animation_playr.play("RESET")
