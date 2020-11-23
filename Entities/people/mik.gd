extends Node2D

func _ready():
	$animator.play("idle")
	
func pick_umbrella():
	$animator.play("pick_umbrella")
	
func drop_umbrella():
	$animator.play_backwards("drop_umbrella")
