extends Node

export (PackedScene) var turret_scene

var X_LIMIT : int = 780
var Y_LIMIT : int = 580

func _ready():
	randomize()
	var turret_list : Array = \
		[turret_scene.instance(), turret_scene.instance(), turret_scene.instance()]
	for turret in turret_list:
		turret.spawn(self, $Player, turret_spawn_position(), X_LIMIT, Y_LIMIT)
		
	$Player.set_values(self, X_LIMIT, Y_LIMIT)

func turret_spawn_position() -> Vector2:
	var safety_limit : int = 50
	var x : float = rand_range(0 + safety_limit, X_LIMIT - safety_limit)
	var y : float = rand_range(0 + safety_limit, (Y_LIMIT - $Player.position.y))
	return Vector2(x, y)
