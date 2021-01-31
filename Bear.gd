extends KinematicBody

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$camera.environment.glow_enabled = state
	$camera.environment.adjustment_enabled = state
	$camera.current = state
	self.visible = state
	$collision.disabled = not state
