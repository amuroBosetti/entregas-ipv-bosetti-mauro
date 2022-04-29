extends Node

export (PackedScene) var turret_scene

func _ready():
	var turret_list : Array = \
		[turret_scene.instance(), turret_scene.instance(), turret_scene.instance()]
	for turret in turret_list:
		turret.spawn(self, $Player, turret_spawn_position())
		
	$Player.set_projectile_container(self)

func turret_spawn_position() -> Vector2:
	#Aca generar vector
	return Vector2(50, 50)
