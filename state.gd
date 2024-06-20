@icon("state gear.svg")
extends Node
class_name State

var state_machine: StateMachine

func enter(previous_state:String="", _msg: Dictionary = {}):
	pass

func proc(_delta: float):
	pass

func phys(_delta: float):
	pass

func exit(_next_state:String=""):
	pass

func transition(state_name: String, msg: Dictionary = {}):
	state_machine.transition(state_name, msg, state_machine.current.name)

var active : bool :
	get:
		return state_machine.current == self
