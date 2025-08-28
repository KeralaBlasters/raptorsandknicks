extends Node3D

@onready var music_player = $MainMusicPlayer
@onready var text = $IntroText/CenterContainer/Text

var last_index: int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_intro()
	Ui.show()
	randomize()
	print("music played ")
	play_random_track()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var music_tracks = [
	preload("res://Audio/Latin Fashion Trap by Infraction [No Copyright Music]  Latin Fusion.mp3"),
		preload("res://Audio/Sport Mexican Latin Trap by Infraction [No Copyright Music]  Mexico Beat.mp3"),
		preload("res://Audio/Vlog Latin Event Beat by Infraction [No Copyright Music]  Valencia.mp3"),
		preload("res://Audio/[FREE FOR PROFIT] Melodic Type Beat - ADDICTED  Dark Type Beat  Rap Trap Beat Instrumental.mp3"),
		preload("res://Audio/[FREE NO COPYRIGHT BEAT 2023] -- WHY NEW HIP HOP  FREESTYLE TYPE INSTRUMENTAL  PUNGZ BEAT.mp3"),
		preload("res://Audio/[FREE NO COPYRIGHT BEAT 2023] FIST NEW HIP HOP  FREESTYLE TYPE INSTRUMENTAL  PUNGZ BEAT.mp3"),
		preload("res://Audio/[FREE]  RICH  Freestyle Trap Beat  HARD Trap Beat 2023  Freestyle Type Beat  Trap Instrumental.mp3"),
]


func show_intro():
	text.text = "WELCOME TO SPEEDSTATE"
	await get_tree().create_timer(5.0).timeout
	text.text = "YOU WILL HAVE TO BECOME THE BEST RACER IN THE CITY"
	await get_tree().create_timer(5.0).timeout
	text.text = "USE THE ARROW KEYS TO DRIVE"
	await get_tree().create_timer(5.0).timeout
	text.text = "PRESS F TO TURN YOUR HEADLIGHTS ON AND OFF"
	await get_tree().create_timer(3.0).timeout
	text.text = "PRESS C TO CHANGE YOUR VIEW"
	await get_tree().create_timer(3.0).timeout
	text.text = "GOOD LUCK AND BECOME THE BEST RACER IN THE CITY"
	await get_tree().create_timer(3.0).timeout
	text.text = ""


func play_random_track():
	var new_index = randi() % music_tracks.size()
	while new_index == last_index and music_tracks.size() > 1:
		new_index = randi() % music_tracks.size()
	last_index = new_index
	
	music_player.stream = music_tracks[new_index]
	print("playing track", new_index)
	music_player.play()
	


func _on_main_music_player_finished() -> void:
	if not music_player.playing:
		play_random_track()
	else:
		pass
