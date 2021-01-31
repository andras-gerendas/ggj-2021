extends StaticBody

var tree3_tex = preload("res://tree3.png")
var tree3_dead_tex = preload("res://tree3_dead.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$texture.set_texture(tree3_dead_tex if state else tree3_tex)
