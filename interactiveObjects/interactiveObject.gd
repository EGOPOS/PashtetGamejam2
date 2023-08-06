extends Area2D

class_name InteractiveObject

var animation: bool = false
@onready var sprite: Sprite2D = get_node("Sprite2D")
@onready var label: Label = get_node("Label")

@export var object_name: String = "Объект"

func _ready():
	label.text = object_name

func set_animation(value: bool):
	label.visible = value
	animation = value
	if animation:
		sprite.material = load("res://interactiveObjects/outlineMaterial.tres")
	else:
		sprite.material = null

func interact():
	pass
