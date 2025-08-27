extends Area2D   
@onready var game_manager=%GameManager

func _ready() -> void:
	$AnimatedSprite2D.play("default")  

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		queue_free()   
		game_manager.add_point()
