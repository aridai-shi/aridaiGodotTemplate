extends Control

func _ready():
	$TextureProgress.tint_progress.a = 0.0
func _physics_process(delta):
	if (self  == get_tree().current_scene):
		print("DON'T RUN THIS SCENE BY ITSELF, ONLY AS A COMPONENT OF MAIN")
		get_tree().change_scene("res://main/Main.tscn")
	else:
		if ($Timer.time_left<=0):
			$TextureProgress.tint_progress.a = lerp($TextureProgress.tint_progress.a, 1.0, delta/2)
			$TextureProgress.tint_progress.h += delta/4
			if ($TextureProgress.tint_progress.h > 1.0):
				$TextureProgress.tint_progress.h = 0.0
func close():
	while ($TextureProgress.tint_progress.a>0):
		$TextureProgress.tint_progress.a = lerp($TextureProgress.tint_progress.a, 0.0, 1/120)
	queue_free()

