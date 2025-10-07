extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	$PanelContainer/PauseOptionsMenu/PauseFullScreen.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
	$PanelContainer/PauseOptionsMenu/PauseMainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$PanelContainer/PauseOptionsMenu/PauseMusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("MUSIC")))
	$PanelContainer/PauseOptionsMenu/PauseSFXVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _process(delta: float) -> void:
	testEsc()


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("Escape") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Escape") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()


func _on_pause_back_pressed() -> void:
	$PanelContainer/PauseOptionsMenu.hide()
	$PanelContainer/Buttons.show()


func _on_pause_quit_pressed() -> void:
	get_tree().quit()


func _on_pause_options_pressed() -> void:
	$PanelContainer/PauseOptionsMenu.show()
	$PanelContainer/Buttons.hide()
	


func _on_pause_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_pause_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)


func _on_pause_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"), value)


func _on_pause_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
