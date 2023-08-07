extends InteractiveObject

@export var action: Global.MONOLOGUES
@export var action_type: Global.TRANSITION_TYPES

func interact():
	if Global.bad_time:
		Global.transition_to(action_type, Global.MONOLOGUES.BAD)
	else:
		Global.transition_to(action_type, Global.MONOLOGUES.BAD_N)
	

