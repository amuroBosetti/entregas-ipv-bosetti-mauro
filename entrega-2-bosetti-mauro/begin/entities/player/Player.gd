extends Sprite

onready var cannon : Sprite = $Cannon

export (float) var ACCELERATION : float = 20.0
export (float) var SPEED_LIMIT : float = 600.0
export (float) var FRICTION_WEIGHT : float = 0.08

var speed = 200 #Pixeles
var projectile_container : Node
var velocity : Vector2 = Vector2.ZERO

# Estamos acoplandonos a Main o quien sea que este arriba y nos pase el nodo
# parent que necesitamos que tenga el projectile. Esto es recomendable unicamente
# cuando queremos que el projectile o lo que sea tenga una matriz de transformacion
# distinta a los elementos que tiene alrededor
func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	
	var mouse_position : Vector2 = 	get_global_mouse_position()
	cannon.look_at(mouse_position)
	
	#En 1:30:29 se muestra que, en el physics process, si no se setteo el projectile_container,
	#se settea uno utilizando owner. Por que? 
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	#Movement
	var direction : int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if direction != 0:
		velocity.x = clamp(velocity.x + (direction * ACCELERATION), -SPEED_LIMIT, SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
		
	position += velocity * delta
	
