extends Control

func _ready() -> void:
	$MarginContainer/OptionsMenu/MainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$MarginContainer/OptionsMenu/MusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("MUSIC")))
	$MarginContainer/OptionsMenu/SFXVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Advanced Vehicle Controller/Scenes/test_world.tscn")


func _on_options_button_pressed():
	$MarginContainer/MainButtons.visible = false
	$MarginContainer/OptionsMenu.visible = true


func _on_quit_button_pressed():
	get_tree().quit()


func _on_back_pressed() -> void:
	$MarginContainer/OptionsMenu.visible = false
	$MarginContainer/MainButtons.visible = true
	


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)


func _on_music_vol_slider_2_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"), value)


func _on_sfx_vol_slider_3_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
