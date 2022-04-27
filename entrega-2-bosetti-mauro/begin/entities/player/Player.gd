extends Sprite

onready var cannon : Sprite = $Cannon

var speed = 200 #Pixeles
var projectile_container : Node

# Estamos acoplandonos a Main o quien sea que este arriba y nos pase el nodo
# parent que necesitamos que tenga el projectile. Esto es recomendable unicamente
# cuando queremos que el projectile o lo que sea tenga una matriz de transformacion
# distinta a los elementos que tiene alrededor
func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	
	var direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	var mouse_position : Vector2 = 	get_global_mouse_position()

	cannon.look_at(mouse_position)
	
	#Solo cuando RECIEN se hizo click
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
		
	position.x += direction * speed * delta
