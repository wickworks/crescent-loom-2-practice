extends Node
class_name Neuron

@onready var timer:Timer = $Timer

@export var toggle_time:float = 3
@export var muscle:DampedSpringJoint2D

@export var is_active:bool = false

func _ready():
	timer.start(toggle_time)
	timer.timeout.connect(toggle)

func toggle():
	is_active = not is_active

	if muscle == null: return
	if is_active:
		print('TENSE')
		muscle.length = 5
		muscle.rest_length = 2
		muscle.stiffness = 30
	else:
		print('RELAX')
		muscle.length = 200
		muscle.rest_length = 100
		muscle.stiffness = 1
