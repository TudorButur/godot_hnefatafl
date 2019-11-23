extends KinematicBody2D

var is_picked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			is_picked = event.pressed
			print("erm")

func _physics_process(delta):
	var movement: Vector2

	if is_picked:
		movement = get_global_mouse_position() - position

	move_and_collide(movement)