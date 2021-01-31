extends StaticBody

var bush_tex = preload("res://bush.png")
var bush_dead_tex = preload("res://bush_dead.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$texture.set_texture(bush_dead_tex if state else bush_tex)
