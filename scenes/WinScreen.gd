extends Node2D


func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level.tscn")


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level 1.tscn")
