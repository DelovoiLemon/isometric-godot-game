extends Camera2D

const CameraSpeed = 30;
var ActiveNegrNode : CharacterBody2D

func _physics_process(_delta):
	position = ActiveNegrNode.position
	
func _on_target_change(Target : Node2D):
	ActiveNegrNode = Target
