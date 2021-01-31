extends KinematicBody

var kid_no_bear_tex = preload("res://kid_no_bear.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$collision.disabled = state
	$texture.set_texture(kid_no_bear_tex)
	$camera.current = not state
