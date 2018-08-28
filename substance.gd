extends RigidBody2D

## congruent to the periodic table of teh elements i guess
onready var key = $"../../".key

var state = "a" #"a" if randf()<.5 else "b"
var previous_state = state

func _ready():
	update()
	rotation = 2*PI*randf()
	
	linear_velocity = Vector2(key[state].speed, 0).rotated(randf()*2*PI)
	
	#physics constants
	set_bounce(1)
	linear_damp = 0

func _process(delta):
	
#	#moveing forward
#	var move = Vector2(key[state].speed, 0)
#	position += move.rotated(rotation)*delta
	
	#random changes
	if randf() <= key[state].volatility*delta :
		state = key[state].products
		rotation = 2*PI*randf()
		previous_state = state	
		update()
	
	# out of bounds
#	if position.x < 0:
#		position.x = get_viewport_rect().size.x
#	if position.y <0:
#		position.y = get_viewport_rect().size.y
#	if position.x > get_viewport_rect().size.x:
#		position.x = 0
#	if position.y > get_viewport_rect().size.y:
#		position.y = 0

func _physics_process(delta):
	pass
	

func _draw():
	#it's ... image?
	draw_circle(Vector2(), key[state].size, key[state].col)
