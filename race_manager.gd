extends Node

var current_checkpoint = 0
var total_checkpoints = 0
var active_checkpoints_node: Node = null

func start_race(checkpoints_node: Node):
	current_checkpoint = 0
	active_checkpoints_node = checkpoints_node
	var checkpoints = checkpoints_node.get_children()
	total_checkpoints = checkpoints.size()
	
	#for checkpoint in checkpoints:
		#checkpoint.connect("player_entered", self, "_on_player_entered_checkpoint")
		

func _on_player_entered_checkpoint(index):
	if index == current_checkpoint:
		current_checkpoint += 1
		if current_checkpoint == total_checkpoints:
			finish_race


func finish_race():
	pass
