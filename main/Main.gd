extends Node2D

var scenes : Dictionary = {"options_menu":"res://main/optionsmenu/OptionsMenu.tscn"}
onready var loadingScreen:PackedScene = preload("res://loading/LoadingScene.tscn")
var loadingScreenInstance:Node
var loader
var wait_frames
var time_max = 20000 # msec


func _ready():
	var root = get_tree().get_root()
func add_scene(id:String): # Game requests to switch to this scene.
	var path
	if !(".tscn" in scenes[id]):
		print("The resource that you're trying to load isn't a scene!")
		return
	else:
		path = scenes[id]
	loader = ResourceLoader.load_interactive(path)
	if loader == null: # Check for errors.
		return
	set_process(true)
	loadingScreenInstance = loadingScreen.instance()
	add_child(loadingScreenInstance)
	wait_frames = 1
	
func _process(time):
	if loader == null:
		# no need to process anymore
		set_process(false)
		return

	# Wait for frames to let the "loading" animation show up.
	if wait_frames > 0:
		wait_frames -= 1
		return

	var t = OS.get_ticks_msec()
	# Use "time_max" to control for how long we block this thread.
	while OS.get_ticks_msec() < t + time_max:
		# Poll your loader.
		var err = loader.poll()
		if err == ERR_FILE_EOF: # Finished loading.
			var resource = loader.get_resource()
			loader = null
			set_new_scene(resource)
			break
		elif err == OK:
			update_progress()
		else: # Error during loading.
			loader = null
			break

func update_progress():
	var progress = float(loader.get_stage()) / loader.get_stage_count()
	loadingScreenInstance.lerpValue = lerp(loadingScreenInstance.lerpValue,progress,1/30)


func set_new_scene(scene_resource):
	var current_scene = scene_resource.instance()
	if (current_scene is Control):
		$UILayer/Control.add_child(current_scene)
	else:
		add_child(current_scene)
	loadingScreenInstance.close()

func _physics_process(delta):
	if (Input.is_action_just_pressed("ui_focus_next") && (get_node_or_null("./OptionsMenu")==null)):
		get_tree().paused = true
		add_scene("options_menu")
