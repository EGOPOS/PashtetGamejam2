extends Area2D

class_name ClickableObject

@export var effect_duration: float
@export var fall_speed: float

func _physics_process(delta):
	var direction: Vector2
	direction.y = 1
	position += direction * fall_speed
	position.y = clamp(position.y, 100, get_parent().get_node("Homeless").global_position.y)

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_mouse_click"):
		make_effect()
		get_tree().create_timer(effect_duration).timeout.connect(effect_end)
		visible = false

func make_effect() -> void:
	pass

func effect_end() -> void:
	pass
