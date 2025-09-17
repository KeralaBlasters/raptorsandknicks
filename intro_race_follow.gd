extends PathFollow3D

@export var speed: float = 10.0
@export var active  = false

@export_range(0.0, 100.0) var max_distance : float = 20.0

@export var division : int = 4

@export var target_veh : VehicleBody3D


	

func _process(delta: float) -> void:
	
	if active: # Check if PathFollow3D is active and if it is then move around defined path, otherwise do nothing
		var distance = self.position.distance_to(target_veh.position) # We calculate distance between PathFollow3D and our vehicle node
		if distance > max_distance: # Checks if distance between Vehicle and PathFollow3D is greater than max_distance
			self.progress += delta * (speed / division) # If distance between Vehicle and PathFollow3D node is greate than max_distance then divide its speed by 2
		else: self.progress += delta * speed # If distance between nodes is in range of max dista
