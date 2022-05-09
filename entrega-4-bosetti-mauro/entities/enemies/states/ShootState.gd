extends "res://entities/AbstractState.gd"

func update(delta):
	parent._handle_shooting()

func exit():
	parent.target = null

func _on_DetectionArea_body_exited(body):
	if body == parent.target:
		emit_signal("finished", "walk")
