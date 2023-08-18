extends Node2D

const negrCount = 1000
const SPEED = 10000.0
const negrPrefix = "Negr"
var negrsList : Array
var activeNegr : int = 0
var cameraTargetChangeCallable : Callable

func _ready():
	cameraTargetChangeCallable = Callable(get_node(get_meta("Camera")), "_on_target_change")
	
	for i in range(0, negrCount, 1):
		create_negr(self, 
					negrPrefix + str(i), 
					get_node(get_meta("NiggaTemplate")),
					Vector2(randf_range(50, 5000), randf_range(50, 5000)))
					

	change_active_negr(0)
	
func create_negr(parent : Node, negrName : String, prototype : CharacterBody2D, negrPosition : Vector2):
	var negr = prototype.duplicate()
	negr.show();
	negr.set_name(negrName)
	negr.position = negrPosition
	negrsList.append(negr)
	parent.add_child(negr)	

func change_active_negr(step):
	var targetNegr = (activeNegr + step) % negrCount
	Callable(negrsList[activeNegr], "_changeActiveStatus").call(false)
	Callable(negrsList[targetNegr], "_changeActiveStatus").call(true)
	cameraTargetChangeCallable.call(negrsList[targetNegr])
	activeNegr = targetNegr

func _on_button_pressed():
	change_active_negr(1)
	
func _on_button_2_pressed():
	change_active_negr(-1)
