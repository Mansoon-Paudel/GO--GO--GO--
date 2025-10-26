extends Node
@onready var game_manager: Node = %GameManager
@onready var dialogue_box: Panel = %"Dialogue-Box"
var dialogue_box_shown:bool = false

func _process(delta: float) -> void:
	if  (game_manager.points == 5 and not dialogue_box_shown):
		dialogue_box.show()
		dialogue_box_shown= true
	if Input.is_action_just_pressed("Enter"):
		dialogue_box.hide()


func _on_continue_button_up() -> void:
	dialogue_box.hide()
