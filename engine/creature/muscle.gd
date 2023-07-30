extends DampedSpringJoint2D
class_name Muscle

@onready var body_a:RigidBody2D = get_node(node_a)
@onready var body_b:RigidBody2D = get_node(node_b)


# would be nice if these were available to us. I know the engine has them.
var offset_a:Vector2
var offset_b:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if body_a and body_b:
		offset_a = position - body_a.position
		offset_b = (position + Vector2.RIGHT.rotated(rotation) * length) - body_b.position


func _process(delta):
	queue_redraw()

func _draw():
	# cancel out our own transform; we'll be drawing globally
	draw_set_transform(-position, -rotation)
	draw_circle(body_a.position-offset_a, 5, Color.CRIMSON)
	draw_circle(body_b.position-offset_b, 5, Color.CORAL)
#	pass
	draw_circle(Vector2.ZERO, 10, Color.CRIMSON)
##	draw_circle(body_b.position, 5, Color.CORAL)
	draw_line(Vector2.ZERO, Vector2.UP * 100, Color.AQUAMARINE, 4)
