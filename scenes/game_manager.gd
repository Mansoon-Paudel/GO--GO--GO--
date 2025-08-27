extends Node
@onready var label=%Label

var points=0

func add_point():
	points = points+1
	print(points)
	label.text = str(points)+"/4"
