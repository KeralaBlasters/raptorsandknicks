extends Node3D

@onready var music_player = $MainMusicPlayer
@onready var text = $IntroText/CenterContainer/Text
@onready var intro_spawn = $Races/IntroRace/StartAndFinish/Marker3D
var can_start_intro_race = false
@onready var intro_race_follow: PathFollow3D = $Races/IntroRace/IntroRaceFollow
@onready var second_race_follow: PathFollow3D = $Races/SecondRace/SecondRaceFollow

var can_start_second_race = false



var last_index: int = -1

var ai_intro_racer = preload("res://Advanced Vehicle Controller/Vehicle/AI_Vehicles/AI_Muscle_Car.tscn")

var ai_second_racer = preload("res://Advanced Vehicle Controller/Vehicle/AI_Vehicles/AI_Muscle_Car2.tscn")

var intro_checkpoint_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = $"Muscle Car"
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
		
	
	if can_start_second_race and Input.is_action_just_pressed("Enter Race"):
		start_second_race()
		can_start_second_race = false
	else:
		pass
		
	
	if intro_checkpoint_number == 9:
		finish_intro_race()
	


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
	intro_checkpoint_number = 0
	var player_intro_spawn = $Races/IntroRace/PlayerIntroSpawn
	var player = $"Muscle Car"
	player.global_position = player_intro_spawn.global_position
	player.global_rotation = player_intro_spawn.global_rotation
	var intro_race_path = $Races/IntroRace/IntroRaceFollow
	var intro_ai_spawn = $Races/IntroRace/Spawn
	var intro_car = ai_intro_racer.instantiate() 
	$Races/IntroRace.add_child(intro_car)
	var path = intro_race_path.get_parent() as Path3D
	var spawned_ai_intro_car = intro_car
	intro_race_follow.target_veh = intro_car
	intro_car.target_ray = intro_race_path
	intro_car.global_transform.origin = intro_ai_spawn.global_transform.origin
	
	$Races/IntroRace/Arrows.show()
	$Races/IntroRace/start_arrow.hide()
	
	
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
		



func _on_first_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1


func _on_second_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1
		


func _on_third_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1


func _on_fourth_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1




func _on_fifth_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1
		




func _on_sixth_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1
		



func _on_seventh_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1




func _on_eighth_checkpoint_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1
		


func _on_finish_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		intro_checkpoint_number += 1


func finish_intro_race():
	#$Races/IntroRace.queue_free()
	text.text = "FINISH"
	$Races/IntroRace.hide()
	await get_tree().create_timer(3.0).timeout
	text.text = ""
	var delete = $Delete
	#ai_intro_racer.global_position = delete.global_position
	#$Races/SecondRace/SecondRaceCheckpoints.queue_free()
	await get_tree().create_timer(10.0).timeout
	$Races/SecondRace.show()
	$Races/SecondRace/SecondArrows.hide()
	intro_checkpoint_number = -100
	



func _on_second_race_start_area_body_entered(body: Node3D) -> void:
	if body.name == "Muscle Car":
		text.text = "PRESS ENTER TO START THE SECOND RACE"
		can_start_second_race = true
	else:
		pass
		



func _on_second_race_start_area_body_exited(body: Node3D) -> void:
	if body.name == "Muscle Car":
		text.text = ""
		can_start_second_race = false
	else:
		pass



func start_second_race():
	$Races/SecondRace/second_start_arrow.hide()
	$Races/SecondRace/SecondArrows.show()
	var player_second_spawn = $Races/SecondRace/PlayerSecondSpawn
	var player = $"Muscle Car"
	player.global_position = player_second_spawn.global_position
	player.global_rotation = player_second_spawn.global_rotation
	var second_race_path = $Races/SecondRace/SecondRaceFollow
	var second_ai_spawn = $Races/SecondRace/SecondSpawn
	var second_ai_car = ai_second_racer.instantiate()
	$Races/SecondRace.add_child(second_ai_car)
	var path = second_race_path.get_parent() as Path3D
	var spawned_second_car = second_ai_car
	second_race_follow.target_veh = second_ai_car
	second_ai_car.target_ray = second_race_path
	second_ai_car.global_transform.origin = second_ai_spawn.global_transform.origin
	
