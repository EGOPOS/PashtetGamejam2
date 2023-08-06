extends Node

class_name AudioManager

@onready var start_music: AudioStreamPlayer = $Music/MainMenuMusic
@onready var current_music: AudioStreamPlayer = start_music
@onready var step_sound: AudioStreamPlayer2D = $GlobalSFX/StepSound
@onready var select_sound: AudioStreamPlayer2D = $GlobalSFX/SelectSound
@onready var char_sound: AudioStreamPlayer = $GlobalSFX/CharDialogSound
@onready var explosions_sound: AudioStreamPlayer2D = $GlobalSFX/ExplosionSound

var noise: FastNoiseLite = FastNoiseLite.new()

enum AUDIO{
	MAIN_MENU_MUSIC,
	MAIN_SCENE_MUSIC,
	TENSION_MUSIC,
	MINIGAME_MUSIC,
	STEP_SOUND,
	SELECT_SOUND,
	CHAR_DIALOG_SOUND,
	EXPLOSIONS_SOUND
}

func change_current_music(_new_music: AUDIO) -> void:
	current_music.stop()
	match _new_music:
		AUDIO.MAIN_MENU_MUSIC:
			current_music = $Music/MainMenuMusic
		AUDIO.MAIN_SCENE_MUSIC:
			current_music = $Music/MainMusic
		AUDIO.TENSION_MUSIC:
			current_music = $Music/TensionMusic
		AUDIO.MINIGAME_MUSIC:
			current_music = $Music/MiniGameMusic
		
	current_music.play()

func play_char_audio(characters: int):
	var new_pitch: float = abs(noise.get_noise_1d(characters)) * 2
	new_pitch = clamp(new_pitch, 0.9, 1.2)
	char_sound.set_pitch_scale(new_pitch)
	char_sound.play()
