extends "res://entities/AbstractState.gd"

var old_velocity : Vector2
onready var dash_timer : Timer = get_node("../../DashTimer")

func enter():
	var old_velocity = parent.velocity
	parent.velocity.x = 5000 * parent.dash_direction
	dash_timer.start()
#	print(parent.test_move(parent.get_global_transform(), Vector2(new_x_position, parent.position.y - 1)))
#	print(parent.transform)
#	print(parent.get_global_transform()) POR QUE NO FUNCIONA?
	

func update(delta:float):
	parent._apply_movement()

func exit():
	parent.velocity = old_velocity

func _on_DashTimer_timeout():
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		emit_signal("finished", "walk")
	else:
		emit_signal("finished", "idle")	
