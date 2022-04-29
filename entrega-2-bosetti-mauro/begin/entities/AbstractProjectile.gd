extends Sprite
class_name Projectile

signal delete_requested(projectile)

export (float) var speed

# Este vector tiene que estar normalizado
var direction : Vector2
var x_bound : int
var y_bound : int

func _physics_process(delta):
	position += direction * speed * delta
	if(position.x > x_bound || position.y > y_bound):
		emit_signal("delete_requested", self)

func _ready():
	set_physics_process(false)
	
func set_starting_values(starting_position : Vector2, direction : Vector2, x_bound : int, y_bound : int):
	global_position = starting_position
	self.direction = direction
	self.x_bound = x_bound
	self.y_bound = y_bound
	$Timer.start()
	set_physics_process(true)


func _on_Timer_timeout():
	emit_signal("delete_requested", self)
