extends Node

@onready var pause_panel: Panel = $"Pause-Panel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var esc =Input.is_action_just_pressed("Pause")
	
	if (esc==true):
		get_tree().paused=true
		pause_panel.show()


func _on_resume_pressed() -> void:
		get_tree().paused=false
		pause_panel.hide()



func _on_go_mainmenu_pressed() -> void:
	get_tree().paused=false
	pause_panel.hide()
	get_tree().change_scene_to_file("res://GO--GO--GO--/scenes/main-menu.tscn")
