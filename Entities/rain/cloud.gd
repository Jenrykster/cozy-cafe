extends Node2D

var size
var point = Vector2()
export (PackedScene) var rain_drop
export (float) var delay_in_rain
export (bool) var is_raining = false
signal weather_changed(is_raining)

var _last_state = 'rain'
func _ready():
	randomize()
	
	$timer.wait_time = delay_in_rain
	size = $area/shape.shape.extents
	
	point.y = (global_position.y + size.y ) / 2
	connect("weather_changed",get_parent(),"on_weather_changed")
	
func _process(delta):
	if(is_raining):
		if(_last_state != 'rain'):
			emit_signal("weather_changed", is_raining)
			
		_last_state = 'rain'
		$timer.paused = false
	else:
		if(_last_state != 'clean'):
			emit_signal("weather_changed", is_raining)
			
		$timer.paused = true
		_last_state = 'clean'
func _on_timer_timeout():
	var drop_inst = rain_drop.instance()
	point.x = rand_range(global_position.x - size.x ,global_position.x + size.x )
	drop_inst.global_position = point
	get_parent().add_child(drop_inst)


func _on_CheckBox_toggled(button_pressed):
	is_raining = button_pressed
