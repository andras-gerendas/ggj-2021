extends Sprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene("res://Menu.tscn")
