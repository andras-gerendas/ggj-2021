extends StaticBody

var rock_tex = preload("res://rock.png")
var rock_dead_tex = preload("res://rock_dead.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$texture.set_texture(rock_dead_tex if state else rock_tex)
