extends Sprite

export (PackedScene) var projectile_scene

onready var fire_position : Position2D = $FirePosition

var projectile_container : Node
var player

func spawn(container, player, spawn_position):
	self.player = player
	self.projectile_container = container
	container.add_child(self)
	position = spawn_position
	$Timer.start()

func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position,
		(player.global_position - fire_position.global_position).normalized()
	)
	projectile.connect("delete_requested", self, "on_projectile_delete_requested")

func on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
