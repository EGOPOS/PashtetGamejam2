extends Node

enum TRANSITION_TYPES{MINI_GAME, LOCATION, CUTSCENE, MONOLOGUE}

enum LOCATIONS{HOME, HOUSE, ENTRANCE}

var locations_paths = {
	LOCATIONS.HOME: load("res://apartments/Home.tscn"),
	LOCATIONS.HOUSE: load("res://house.tscn"),
	LOCATIONS.ENTRANCE: load("res://entrance.tscn")
}

enum MONOLOGUES {PLANT, PHONE, BOXES, WARDROBE, KITCHEN, BAD, SLEEP_ONE, SLEEP_TWO}

var monologue_paths = {
	MONOLOGUES.PLANT: load("res://dialogue/plantMonologue.tscn"),
	MONOLOGUES.PHONE: load("res://dialogue/phoneMonologue.tscn"),
	MONOLOGUES.BOXES: load("res://dialogue/boxMonologue.tscn"),
	MONOLOGUES.WARDROBE: load("res://dialogue/wardrobeMonologue.tscn"),
	MONOLOGUES.KITCHEN: load("res://dialogue/kitchenMonologue.tscn"),
	MONOLOGUES.BAD: load("res://dialogue/bad_monologue.tscn"),
	MONOLOGUES.SLEEP_ONE: load("res://dialogue/Sleep_one.tscn"),
	MONOLOGUES.SLEEP_TWO: load("res://dialogue/Sleep_two.tscn")
}

enum MINIGAMES {COOKING, POWER_ENABLING, SLEEP, NONE}

var minigames_paths = {
	MINIGAMES.COOKING: load(""),
	MINIGAMES.POWER_ENABLING: load(""),
	MINIGAMES.SLEEP: load("res://minigames/SleepMiniGame/Scenes/sleep_mini_game.tscn"),
	MINIGAMES.NONE: null
}

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
			get_tree().current_scene.add_child(monologue_paths[action].instantiate())
