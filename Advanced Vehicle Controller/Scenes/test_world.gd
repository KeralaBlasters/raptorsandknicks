extends Node3D

var ui_scene = preload("res://Advanced Vehicle Controller/Scenes/ui.tscn")
var ui_instance = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ui.show()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_lap_counter_body_entered(body):
	if body.is_in_group("Vehicle"):
		print("entered lap counter body")
		
		Ui.update_laps()
		
	else:
		pass
		
