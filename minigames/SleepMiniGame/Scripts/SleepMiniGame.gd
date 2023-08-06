extends MiniGame

@export var cursor_damage: int
@export var mob_speed: float:
	set(_new_speed):
		mob_speed = _new_speed
		change_mob_speed(_new_speed)

@export var mob_scene: PackedScene
@export var objects_scenes: Array[PackedScene]
@export var score: int = 0
@export var health_points: float
@export var mob_prop_scale: float = 1
@export var action: Global.LOCATIONS
@export var action_type: Global.TRANSITION_TYPES

@onready var mob_path: PathFollow2D = $Path2D/MobPath
@onready var mob_spawn_timer: Timer = $MobTimer
@onready var object_path: PathFollow2D = $Path2D2/ObjectsPath

func _ready():
	Audio.change_current_music(Audio.AUDIO.MINIGAME_MUSIC)

func spawn_mob() -> void:
	var mob: SleepMob = mob_scene.instantiate()
	mob.global_position = get_spawn_position()
	mob.speed = mob_speed
	mob.hit.connect(update_mob_scale)
	add_child(mob)

func change_mob_speed(_new_speed) -> void:
	for mob in get_children():
		if mob is SleepMob:
			mob.speed = _new_speed

func spawn_objects() -> void:
	var object_random_index: int = randi() % objects_scenes.size()
	var object: ClickableObject = objects_scenes[object_random_index].instantiate()
	object.global_position = get_object_spawn_position()
	add_child(object)

func get_object_spawn_position() -> Vector2:
	var spawn_pos: Vector2
	object_path.progress_ratio = randf_range(0.0, 1.0)
	spawn_pos = object_path.position
	
	return spawn_pos

func get_spawn_position() -> Vector2:
	var spawn_pos: Vector2
	mob_path.progress_ratio = randf_range(0.0, 1.0)
	spawn_pos = mob_path.global_position
	
	return spawn_pos

func give_damage_to_player() -> void:
	health_points -= 25
	update_health_points(health_points)
	if health_points <= 0:
		exit_minigame()
		Global.call_deferred("transition_to", Global.TRANSITION_TYPES.MONOLOGUE, Global.MONOLOGUES.SLEEP_TWO)

func update_score_label(delta_score) -> void:
	score += delta_score
	$ScoreLabel.text = str(score)
	if score >= 1000:
		exit_minigame()
		Global.call_deferred("transition_to", Global.TRANSITION_TYPES.MONOLOGUE, Global.MONOLOGUES.SLEEP_ONE)

func update_mob_scale(_mob: SleepMob):
	_mob.reward_score *= mob_prop_scale
	_mob.get_node("Explosion").scale *= mob_prop_scale

func update_health_points(new_value: float) -> void:
	$HPBar.value = new_value

func exit_minigame() -> void:
	Global.transition_to(action_type, action, Vector2(-157, -10))
	Audio.change_current_music(Audio.AUDIO.MAIN_SCENE_MUSIC)

func take_damage(body) -> void:
	if body is SleepMob:
		give_damage_to_player()
		body.kill()
