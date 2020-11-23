extends RigidBody2D

var last_position: Vector2 
var local_collision_pos
export (PackedScene) var splash 
func _integrate_forces( state ):
	if(state.get_contact_count() >= 1):  #this check is needed or it will throw errors 
		local_collision_pos = state.get_contact_collider_position(0)

func _on_raindrop_collide(body:Node2D):
	if(body.is_in_group('rain')):
		pass
	else:
		var collision_position = local_collision_pos + global_position
		last_position = global_position 
		var splash_instance = splash.instance()
		splash_instance.global_position = last_position
		get_parent().add_child(splash_instance)
		get_parent().remove_child(self)
		


