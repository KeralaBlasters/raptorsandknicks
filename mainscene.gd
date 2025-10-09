extends Node3D

@onready var music_player = $MainMusicPlayer
@onready var text = $IntroText/CenterContainer/Text
@onready var intro_spawn = $Races/IntroRace/StartAndFinish/Marker3D
var can_start_intro_race = false
@onready var intro_race_follow: PathFollow3D = $Races/IntroRace/IntroRaceFollow


var last_index: int = -1

var ai_intro_racer = preload("res://Advanced Vehicle Controller/Vehicle/AI_Vehicles/AI_Muscle_Car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_intro()
	Ui.show()
	randomize()
	play_random_track()
	$Races/IntroRace/Arrows.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	if can_start_intro_race and Input.is_action_just_pressed("Enter Race"):
		start_intro_race()
		can_start_intro_race = false
	else:
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
	text.text = "PRESS ESCAPE TO PAUSE THE GAME"
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


func _on_enter_race_area_body_exited(body: Node3D) -> void:
	if body.name == "Muscle Car":
		text.text = ""
		can_start_intro_race = false
	else:
		pass
		
	
	


func start_intro_race():
	var intro_race_path = $Races/IntroRace/IntroRaceFollow
	var intro_ai_spawn = $Races/IntroRace/Spawn
	var intro_car = ai_intro_racer.instantiate() 
	var path = intro_race_path.get_parent() as Path3D
	add_child(intro_car)
	intro_race_follow.target_veh = intro_car
	intro_car.target_ray = intro_race_path
	intro_car.global_transform.origin = intro_ai_spawn.global_transform.origin
	
	
	
	
	text.text = "3"
	await get_tree().create_timer(1.0).timeout
	text.text = "2"
	await get_tree().create_timer(1.0).timeout
	text.text = "1"
	await get_tree().create_timer(1.0).timeout
	text.text = "GO!"
	await get_tree().create_timer(2.5).timeout
	text.text = ""
	intro_race_follow.active = true
	intro_car.active = true




func _on_enter_intro_race_area_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		text.text = "PRESS ENTER TO START THE INTRO RACE"
		can_start_intro_race = true
	else:
		pass
		




func _on_enter_intro_race_area_body_exited(body: Node3D) -> void:
	if body.name == "Muscle Car":
		text.text = ""
		can_start_intro_race = false
	else:
		pass
		
