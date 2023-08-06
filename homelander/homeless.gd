extends CharacterBody2D

class_name Player

@onready var interactiveArea: Area2D = get_node("Area2D")
@onready var sprite: Sprite2D = get_node("Sprite2D")
@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

@export var camera_zoom: Vector2 = Vector2(7, 7):
	set(_new_zoom):
		camera_zoom = _new_zoom
		$Camera2D.zoom = camera_zoom

@export var speed: float = 30
var direction: Vector2 = Vector2(0, 1)

var interactive_object: InteractiveObject = null

func _physics_process(delta):
	direction.x = Input.get_axis("left", "right")
	
	if direction.x:
		animation_player.play("walk")
		sprite.flip_h = direction.x < 0
	else:
		animation_player.play("idle")
		
	velocity = direction * speed
	move_and_slide()
	
#	if Input.is_action_just_pressed("interact") && interactive_object:
#		interact()

func _input(event):
	if event.is_action_pressed("interact") && interactive_object != null:
		interact()

func interact():
	interactive_object.interact()

func _on_area_2d_area_entered(area):
	if area is InteractiveObject:
		if interactive_object:
			interactive_object.set_animation(false)
		interactive_object = area
		interactive_object.set_animation(true)
		Audio.select_sound.play()

func _on_area_2d_area_exited(area):
	if area == interactive_object:
		interactive_object.set_animation(false)
		interactive_object = null
