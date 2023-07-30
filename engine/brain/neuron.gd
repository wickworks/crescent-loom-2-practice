extends Node
class_name Neuron


@onready var timer:Timer = $Timer

@export var toggle_time:float = 3
@export var muscle:DampedSpringJoint2D

@export var is_active:bool = false

@export var enabled:bool = true

var starting_length:int = 0

func _ready():
	timer.start(toggle_time)
	timer.timeout.connect(toggle)
	
	if muscle:
		starting_length = muscle.length


const ACTIVE_STIFFNESS:float = 10

func toggle():
	is_active = not is_active

	if not enabled or muscle == null: return
	if is_active:
		print('TENSE')
#		muscle.length = 5
		muscle.rest_length = 1
#		muscle.length = 1
		muscle.stiffness = ACTIVE_STIFFNESS
		muscle.damping = .01
	else:
		print('RELAX')
#		muscle.length = 200
		muscle.rest_length = 0 # defaults to their starting length
#		muscle.length = starting_length
		muscle.stiffness = .1
#		muscle.stiffness = .1
		muscle.damping = .01
