extends Node2D

export(Array, PackedScene) var scenes
func load_level(id:String):
	for scene in scenes:
		if (scene as PackedScene).resource_name == id:
			add_child((scene as PackedScene).instance())
func _ready():
	pass
	

