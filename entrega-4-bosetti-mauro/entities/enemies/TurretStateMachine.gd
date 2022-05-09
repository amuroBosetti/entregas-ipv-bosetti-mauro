extends "res://entities/AbstractStateMachine.gd"

func _ready():
	states_map = {
		"walk": $Walk,
		"shoot": $Shoot
	}
