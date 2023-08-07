extends AnimationPlayer


func _on_animation_finished(_self):
	Global.transition_to(Global.TRANSITION_TYPES.LOCATION, Global.LOCATIONS.ENTRANCE, Vector2(17, -10))
	Global.call_deferred("transition_to", Global.TRANSITION_TYPES.MONOLOGUE, Global.MONOLOGUES.START_M)
