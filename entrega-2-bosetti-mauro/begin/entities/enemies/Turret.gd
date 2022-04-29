extends Sprite

export (PackedScene) var projectile_scene

onready var fire_position : Position2D = $FirePosition

var projectile_container : Node
var player
var x_limit : int
var y_limit : int

func spawn(container, player, spawn_position, x_limit, y_limit):
	self.player = player
	self.projectile_container = container
	position = spawn_position
	self.x_limit = x_limit
	self.y_limit = y_limit
	container.add_child(self)
	$Timer.start()

func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position,
		(player.global_position - fire_position.global_position).normalized(),
		x_limit,
		y_limit
	)
	projectile.connect("delete_requested", self, "on_projectile_delete_requested")

func on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
