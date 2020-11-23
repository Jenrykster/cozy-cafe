extends Node2D

signal pick_umbrella
signal drop_umbrella
func _ready():
	for child in get_children():
		if child.is_in_group('people'):
			connect("pick_umbrella",child,"pick_umbrella")
			connect("drop_umbrella",child,"drop_umbrella")

func on_weather_changed(raining):
	print("Signal dco")
	if(raining):
		emit_signal("pick_umbrella")
	else:
		emit_signal("drop_umbrella")
