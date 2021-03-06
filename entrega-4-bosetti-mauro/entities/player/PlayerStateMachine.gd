extends "res://entities/AbstractStateMachine.gd"

func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"dead": $Dead,
		"jump": $Jump,
		"dash": $Dash
	}

func notify_hit(amount):
	PlayerData.current_health += min(amount, PlayerData.max_health)
	print(PlayerData.current_health)
