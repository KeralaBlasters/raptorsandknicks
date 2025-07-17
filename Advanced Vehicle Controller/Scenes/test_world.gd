extends Node3D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_lap_counter_body_entered(body):
	if body.is_in_group("Vehicle"):
		print("entered lap counter body")
		Ui.update_laps()
		
	else:
		pass
		
