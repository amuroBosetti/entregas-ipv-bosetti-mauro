extends Sprite

export (float) var speed:float = 75

func _process(delta):

	var movement_right = int(Input.is_action_pressed("move_right"))
	var movement_left = int(Input.is_action_pressed("move_left"))

	var direction = movement_right - movement_left
	
	position.x += (direction * speed) * delta
 
