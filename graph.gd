extends Panel

func _ready():
	pass

func _draw():
	var record = $"../../../../../".record
	var record_length = $"../../../../../".record_length
	var key = $"../../../../../".key
	var total = $"../../../../../".total
	
	if key != null and record.size() > 1:
		
		for type in key:
			
			var line = []
			
			for i in range(record.size()):
								
				line.append(Vector2(rect_size.x / record_length * i, 
						rect_size.y *(1- record[i][type] / float(total))))
				
			
			for i in range(1, line.size()):
				draw_line(line[i-1], line[i], key[type].col)