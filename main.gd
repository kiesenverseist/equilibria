extends Node

onready var substance_pk = preload("res://substance.tscn")

var key

var record = []
export var record_length = 120

export var total = 500

func _ready():
	
	key = substance_pk.instance().key
	
	for i in range(total):
		var substance = substance_pk.instance()
		substance.position = Vector2($GUI.get_viewport_rect().size.x*randf(),
				$GUI.get_viewport_rect().size.y*randf())
		$substances.add_child(substance)


func count():
	var count = {}
	var total = 1
	
	for substance in $substances.get_children():
		var type = substance.state
		
		if count.has(type):
			count[type] += 1
		else:
			count[type] = 1
		
		total += 1
	
	count["total"] = total
	
	return count

func _on_Timer_timeout():
	record.push_back(count())
	
	if record.size() > record_length:
		record.pop_front()
	
	$GUI/Container/menue/graph/graph_Panel.update()
