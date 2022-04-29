extends Sprite

onready var fire_position : Position2D = $FirePosition

export (PackedScene) var projectile_scene : PackedScene

var projectile_container : Node
var x_limit : int
var y_limit : int

func fire():
	var projectile_instance : Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(
		fire_position.global_position, 
		(fire_position.global_position - global_position).normalized(),
		x_limit,
		y_limit
	)
	projectile_instance.connect("delete_requested", self, "_on_projectile_delete_requested")
	
func _on_projectile_delete_requested(projectile : Projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
