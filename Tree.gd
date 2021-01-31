extends StaticBody

var tree_tex = preload("res://tree2.png")
var tree_dead_tex = preload("res://tree_dead.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$texture.set_texture(tree_dead_tex if state else tree_tex)
