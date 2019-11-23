extends Node2D

var window = OS.get_window_safe_area()
var size = 64
var grid_width = 12
var grid_height = 7 #Breaks if even
var origin = [(1024-size*grid_width)/2,(600-size*grid_height)/2]
var colour1 = Color(0.337,0.769,0.200)
var colour2 = Color(0.816,0.976,0.647)
var squares = []

var assets = [ preload("res://Scenes/Soldier.tscn")
]

# Called when the node enters the scene tree for the first time.
func _draw():
	print(window)
	var cond = true
	for i in range(grid_width):
		for j in range(grid_height):
			
			var rect = Rect2(Vector2(origin[0]+i*size,origin[1]+j*size), Vector2(size,size))
			
			var colour
			if cond:
				colour = colour1
			else:
				colour = colour2

			draw_rect(rect, colour)
			cond = not cond
			
	print(squares)
	pass # Replace with function body.

func _ready():
     var soldier = assets[0].instance()
     add_child(soldier)

     soldier.position = Vector2(20, 20)
     

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
