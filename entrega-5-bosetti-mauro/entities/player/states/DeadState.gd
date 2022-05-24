extends "res://entities/AbstractState.gd"

func enter():
	parent._play_animation("dead")
	yield(get_tree().create_timer(0.9), "timeout")
	parent._remove()


func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
