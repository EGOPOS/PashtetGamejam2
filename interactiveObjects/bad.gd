extends InteractiveObject

@export var action: Global.MONOLOGUES
@export var action_type: Global.TRANSITION_TYPES

func interact():
	Global.transition_to(action_type, action)

