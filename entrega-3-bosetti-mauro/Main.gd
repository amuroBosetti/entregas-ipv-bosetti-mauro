extends Node

onready var player = $Player
onready var turret_spawner = $TurretsSpawner
onready var pit_turret = $PitTurret

func _ready():
	randomize()
	player.initialize(self)
	turret_spawner.initialize()
	pit_turret.initialize(self)
