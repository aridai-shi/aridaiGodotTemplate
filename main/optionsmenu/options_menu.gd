extends Control

onready var FirstFocus = get_node("Mrgn/Pnl/VBox/Settings/Mrgn/VBox/Display/WindowMode/Bool")


func _ready() -> void:
	get_tree().paused = true
	FirstFocus.grab_focus()


func _on_Close_pressed() -> void:
	get_tree().paused = false
	queue_free()


func _input(event: InputEvent) -> void:
	if (event is InputEventKey) and (event.is_pressed() ):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if (event is InputEventMouseMotion):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
