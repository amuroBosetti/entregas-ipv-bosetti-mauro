extends "res://entities/AbstractState.gd"

func update(delta:float):
	parent._handle_walking()

func _on_DetectionArea_body_entered(body):
	if parent.target == null && body is Player:
		parent.target=body
		emit_signal("finished", "shoot")
