extends Area2D   
@onready var game_manager=%GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	$AnimatedSprite2D.play("default")  

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animation_player.play("new_animation")
		game_manager.add_point()
