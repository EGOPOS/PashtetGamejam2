extends CharacterBody2D

class_name Player

@onready var interactiveArea: Area2D = get_node("Area2D")

@export var camera_zoom: Vector2 = Vector2(7, 7):
	set(_new_zoom):
		camera_zoom = _new_zoom
		$Camera2D.zoom = camera_zoom

@export var speed: float = 30
var direction: Vector2 = Vector2(0, 1)

var interactive_object: InteractiveObject = InteractiveObject.new()

func _ready():
	Audio.change_current_music(Audio.AUDIO.MAIN_SCENE_MUSIC)

func _physics_process(delta):
	direction.x = Input.get_axis("left", "right")
	velocity = direction * speed
	move_and_slide()
	
#	if Input.is_action_just_pressed("interact") && interactive_object:
#		interact()

func _input(event):
	if event.is_action_pressed("interact"):
		interact()

func interact():
	interactive_object.interact()

func _on_area_2d_area_entered(area):
	if area is InteractiveObject:
		interactive_object = area
		interactive_object.set_animation(true)
		Audio.select_sound.play()

func _on_area_2d_area_exited(area):
	if area == interactive_object:
		interactive_object.set_animation(false)
		interactive_object = InteractiveObject.new()
