extends MiniGame

@export var cursor_damage: int
@export var mob_speed: float
@export var mob_scene: PackedScene
@export var object_scene: PackedScene

@onready var mob_path: PathFollow2D = $Path2D/MobPath
@onready var mob_spawn_timer: Timer = $MobTimer

func _ready():
	Audio.change_current_music(Audio.AUDIO.TENSION_MUSIC)

func spawn_mob() -> void:
	var mob: SleepMob = mob_scene.instantiate()
	mob.global_position = get_spawn_position()
	mob.speed = mob_speed
	add_child(mob)

func spawn_objects() -> void: #TODO Fuck this is idea <:(
	pass

func get_spawn_position() -> Vector2:
	var spawn_pos: Vector2
	mob_path.progress_ratio = randf()#randf_range(0.0, 1.0)
	spawn_pos = mob_path.global_position
	
	return spawn_pos
