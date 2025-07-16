extends Control



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Advanced Vehicle Controller/Scenes/World.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Advanced Vehicle Controller/Scenes/options_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
