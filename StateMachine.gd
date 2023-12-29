@icon("fsmgears.svg")
extends Node
class_name StateMachine

@export var initial_state: State
var current: State
var _map: Dictionary = {}
func _ready():
	if Engine.is_editor_hint(): return
	for child in get_children():
		if child is State:
			if not initial_state: initial_state = child
			child.state_machine = self
			_map[child.name] = child
	current = initial_state
	current.enter()
		
func _process(delta):
	if Engine.is_editor_hint(): return
	if current: current.proc(delta)
	
func _physics_process(delta):
	if Engine.is_editor_hint(): return
	if current: current.phys(delta)

func transition(state_name: String, args: Dictionary = {}):
	current.exit()
	if not state_name in _map:
		current = initial_state
		print("%s does not have a %s state" % [owner.name, state_name])
	else:
		current = _map[state_name]
	current.enter(args)

func has_state(state_name: String) -> bool:
	return state_name in _map
