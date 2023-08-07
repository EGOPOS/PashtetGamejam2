extends Node

enum TRANSITION_TYPES{MINI_GAME, LOCATION, CUTSCENE, MONOLOGUE}

enum LOCATIONS{HOME, HOUSE, ENTRANCE}

var locations_paths = {
	LOCATIONS.HOME: load("res://apartments/Home.tscn"),
	LOCATIONS.HOUSE: load("res://house.tscn"),
	LOCATIONS.ENTRANCE: load("res://entrance.tscn")
}

enum MONOLOGUES {PLANT, PHONE, BOXES, WARDROBE, KITCHEN, KITCHEN_N, BAD, BAD_N, SLEEP_ONE, SLEEP_TWO, COOKING_BAD, COOKING_GOOD, START_M, END_M}

var monologue_paths = {
	MONOLOGUES.PLANT: load("res://dialogue/plantMonologue.tscn"),
	MONOLOGUES.PHONE: load("res://dialogue/phoneMonologue.tscn"),
	MONOLOGUES.BOXES: load("res://dialogue/boxMonologue.tscn"),
	MONOLOGUES.WARDROBE: load("res://dialogue/wardrobeMonologue.tscn"),
	MONOLOGUES.KITCHEN: load("res://dialogue/kitchen_to_cooking_monoligue.tscn"),
	MONOLOGUES.KITCHEN_N: load("res://dialogue/kitchenMonologue.tscn"),
	MONOLOGUES.BAD: load("res://dialogue/bad_monologue.tscn"),
	MONOLOGUES.BAD_N: load("res://dialogue/bad_monologue_unsleep.tscn"),
	MONOLOGUES.SLEEP_ONE: load("res://dialogue/Sleep_one.tscn"),
	MONOLOGUES.SLEEP_TWO: load("res://dialogue/Sleep_two.tscn"),
	MONOLOGUES.COOKING_BAD: load("res://dialogue/cooking_bad_variant.tscn"),
	MONOLOGUES.COOKING_GOOD: load("res://dialogue/cooking_good_variant.tscn"),
	MONOLOGUES.START_M: load("res://dialogue/startSceneMonologue.tscn"),
	MONOLOGUES.END_M: load("res://dialogue/endingSceneMonologue.tscn"),
}

enum MINIGAMES {COOKING, POWER_ENABLING, SLEEP, END, NONE}

var minigames_paths = {
	MINIGAMES.COOKING: load("res://minigames/Cooking/cookingMiniGame.tscn"),
	MINIGAMES.POWER_ENABLING: load("res://minigames/ElectricalPanel/electricalPanelMiniGame.tscn"),
	MINIGAMES.SLEEP: load("res://minigames/SleepMiniGame/Scenes/sleep_mini_game.tscn"),
	MINIGAMES.END: load("res://minigames/end.tscn"),
	MINIGAMES.NONE: null
}

var kitchen_minigame_score: int
#var thunder_time = false
var bad_time = false
var escape_time = false

func transition_to(type: TRANSITION_TYPES, action: int, _player_pos: Vector2 = Vector2.ZERO):
	match type:
		TRANSITION_TYPES.LOCATION:
			get_tree().change_scene_to_packed(locations_paths[action])
			await get_tree().create_timer(0.001).timeout
			if _player_pos != Vector2.ZERO:
				var player = get_tree().current_scene.get_node_or_null("homeless")
				player.global_position = _player_pos

		TRANSITION_TYPES.CUTSCENE:
			pass
		
		TRANSITION_TYPES.MINI_GAME:
			get_tree().change_scene_to_packed(minigames_paths[action])
			
		TRANSITION_TYPES.MONOLOGUE:
			for c in get_tree().current_scene.get_children():
				if c is Dialogue:
					if c.animation_player.current_animation != "hide":
						c.animation_player.play("hide")
			get_tree().current_scene.add_child(monologue_paths[action].instantiate())

func thunder_event():
	Audio.change_current_music(Audio.AUDIO.TENSION_MUSIC)
