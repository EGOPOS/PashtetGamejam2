extends Area2D

class_name InteractiveObject

var animation: bool = false
@onready var sprite: Sprite2D = get_node("Sprite2D")

@export var minigame_scene: PackedScene
@export var action_type: Global.TRANSITION_TYPES

func set_animation(value: bool):
	animation = value
	if animation:
		sprite.material = load("res://interactiveObjects/outlineMaterial.tres")
	else:
		sprite.material = null

func interact():
	Global.transition_to(action_type, minigame_scene)
