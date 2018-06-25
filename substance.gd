extends Node2D

## congruent to the periodic table of teh elements i guess
var key = {
	"a" : {
		col = Color(0.2, 0.5, 1),
		size = 12,
		speed = 50,
		volatility = .04,
		products = "b"
	},
	"b" : {
		col = Color(0.5, 1, 0.2),
		size = 12,
		speed = 50,
		volatility = .02,
		products = "a"
	}
}

var state = "a" #"a" if randf()<.5 else "b"
var previous_state = state

func _ready():
	update()
	rotation = 2*PI*randf()

func _process(delta):
	
	#moveing forward
	var move = Vector2(key[state].speed, 0)
	position += move.rotated(rotation)*delta
	
	#random changes
	if randf() <= key[state].volatility*delta :
		state = key[state].products
		rotation = 2*PI*randf()
		previous_state = state	
		update()
	
	# out of bounds
	if position.x < 0:
		position.x = get_viewport_rect().size.x
	if position.y <0:
		position.y = get_viewport_rect().size.y
	if position.x > get_viewport_rect().size.x:
		position.x = 0
	if position.y > get_viewport_rect().size.y:
		position.y = 0


func _draw():
	
	#it's ... image?
	draw_circle(Vector2(), key[state].size, key[state].col)
