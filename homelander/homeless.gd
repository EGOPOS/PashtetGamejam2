extends CharacterBody2D

class_name Player

@onready var interactiveArea: Area2D = get_node("Area2D")

@export var speed: float = 30
var direction: Vector2 = Vector2(0, 1)

var interactive_object: InteraciveObject

func _physics_process(delta):
	direction.x = Input.get_axis("left", "right")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("interact") && interactive_object:
		interact()

func interact():
	interactive_object.interact()

func _on_area_2d_area_entered(area):
	if area is InteraciveObject:
		interactive_object = area
		interactive_object.set_animation(true)

func _on_area_2d_area_exited(area):
	if area == interactive_object:
		interactive_object.set_animation(false)
		interactive_object = null
