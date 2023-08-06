extends CharacterBody2D

class_name SleepMob

signal hit

var health_points: int = 100
var speed: float = 200

@onready var homeless: Area2D = get_parent().get_node("Homeless")
@onready var agent: NavigationAgent2D = get_node("NavigationAgent2D")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var reward_score: int = 25

#func _ready() -> void:
#	pass

func _physics_process(delta) -> void:
	var next_path_pos: Vector2
	next_path_pos = find_target()
	make_velocity(next_path_pos)
	
	move_and_slide()

func find_target() -> Vector2:
	var target_pos: Vector2 = homeless.global_position
	agent.set_target_position(target_pos)
	var next_path_position: Vector2 = agent.get_next_path_position()
	
	return next_path_position

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_mouse_click"):
		_take_damage(get_parent().cursor_damage)

func make_velocity(_pos: Vector2) -> void:
	var direction: Vector2
	direction = global_position.direction_to(_pos)
	
	velocity = direction * speed

func _take_damage(_damage: int) -> void:
	health_points -= _damage
	play_take_damage_anim()
	emit_signal("hit", self)
	if health_points <= 0:
		Audio.explosions_sound.play()
		play_death_animation_and_kill()

func kill() -> void:
	get_parent().update_score_label(reward_score)
	queue_free()

func play_death_animation_and_kill() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(2, 0.1), 0.1)
	$Explosion.show()
	$Explosion.play()
	tween.finished.connect(kill)

func play_take_damage_anim() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(1, 0.7), 0.1)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(3.5, 4), 0.1)
	
