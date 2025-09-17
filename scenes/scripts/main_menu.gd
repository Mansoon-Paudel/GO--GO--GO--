extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://GO--GO--GO--/scenes/scenes/level-2.tscn")
	
	


func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://GO--GO--GO--/scenes/scenes/Level-1.tscn")



func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://GO--GO--GO--/scenes/scenes/Open World.tscn")
