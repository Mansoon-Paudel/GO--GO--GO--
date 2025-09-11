extends Area2D

@onready var game_manager = %GameManager
@onready var winner: Panel = $winner


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):  
		if game_manager.points >= 4:
			get_tree().change_scene_to_file("res://GO--GO--GO--/scenes/main-menu.tscn")
		else:
			print("Not enough coins!")
