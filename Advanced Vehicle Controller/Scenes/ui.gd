extends CanvasLayer

var lap_count = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_laps():
	lap_count += 1
	$VBoxContainer/Laps.text = "Laps: " + str(lap_count)
