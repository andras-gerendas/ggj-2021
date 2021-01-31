extends KinematicBody

var monster3_tex = preload("res://monster3.png")
var monster3_shadow_tex = preload("res://monster3_shadow.png")

func _ready():
	get_node("/root/Spatial").connect("dimensional_shift", self, "_on_dimensional_shift")

func _on_dimensional_shift(state):
	$texture.set_texture(monster3_tex if state else monster3_shadow_tex)

func _physics_process(delta):
	var kid = get_node("/root/Spatial/kid")
	
	if kid != null:
		var between = Vector2(self.get_translation().x, self.get_translation().z) - Vector2(kid.get_translation().x, kid.get_translation().z)
		if between.length() > 0.1:
			between = between.normalized() / 30
			var collide = self.move_and_collide(Vector3(-between.x, 0, -between.y))
			if collide and collide.collider.name == "kid":
				get_tree().change_scene("res://GameOver.tscn")
