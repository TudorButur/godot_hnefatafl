extends Node2D

var window = OS.get_window_safe_area()
var size = 96
var grid_width = 9
var grid_height = 9 #Breaks if even
var origin = Vector2((1024-size*grid_width)/2,(1000-size*grid_height)/2)
var colour1 = Color(0.337,0.769,0.200)
var colour2 = Color(0.816,0.976,0.647)



var layout =[[0,0,0,1,1,1,0,0,0],
			 [0,0,0,0,1,0,0,0,0],
			 [0,0,0,0,2,0,0,0,0],
			 [1,0,0,0,2,0,0,0,1],
			 [1,1,2,2,3,2,2,1,1],
			 [1,0,0,0,2,0,0,0,1],
			 [0,0,0,0,2,0,0,0,0],
			 [0,0,0,0,1,0,0,0,0],
			 [0,0,0,1,1,1,0,0,0]]

var assets = [preload("res://Scenes/Soldier.tscn")]
var sprites = [0, 
preload("res://media/pawn_black.png"),
preload("res://media/grenadier.png"),
preload("res://media/king.png")]

# Called when the node enters the scene tree for the first time.
func _draw():
	var cond = true
	for i in range(grid_width):
		for j in range(grid_height):
			
			var rect = Rect2(Vector2(origin.x+i*size,origin.y+j*size), Vector2(size,size))
			
			var colour
			if cond:
				colour = colour1
			else:
				colour = colour2

			draw_rect(rect, colour)
			cond = not cond
		
	pass # Replace with function body.

func _ready():
	for i in range(9):
		for j in range(9):
			if layout[i][j] == 0:
				continue
			else:
				var soldier = assets[0].instance()
				add_child(soldier)
				soldier.position = Vector2(origin.x + j*size + 48, origin.y + i*size + 48)
				var sprite = soldier.get_node("Sprite")
				sprite.set_texture(sprites[layout[i][j]]) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
