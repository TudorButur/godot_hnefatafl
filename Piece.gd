extends KinematicBody2D

var is_picked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_a8_input_event(viewport, event, shape_idx):
     if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT:
           if not event.pressed:
              print("let go on a8")
              var owner_id = shape_find_owner(shape_idx)
              var tile = shape_owner_get_owner(owner_id)

              print(shape_idx, owner_id)
              print(tile.position)
              move_and_collide(tile.position)

func _on_b8_input_event(viewport, event, shape_idx):
     if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT:
           if not event.pressed:
              
              print("let go on b8")


func _input_event(viewport, event, shape_idx):
     if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT:
           is_picked = event.pressed
           

func _physics_process(delta):
     var movement: Vector2

     if is_picked:
        movement = get_global_mouse_position() - position

     move_and_collide(movement)
