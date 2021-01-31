extends Sprite

var selected = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_ESCAPE:
				get_tree().quit()
			if event.scancode == KEY_DOWN:
				if selected < 2:
					$cursor.translate(Vector2(0, 155))
					selected += 1
				else:
					$cursor.translate(Vector2(0, -310))
					selected = 0
			if event.scancode == KEY_UP:
				if selected == 0:
					$cursor.translate(Vector2(0, 310))
					selected = 2
				else:
					$cursor.translate(Vector2(0, -155))
					selected -= 1
			if event.scancode == KEY_SPACE or event.scancode == KEY_ENTER:
				if selected == 0:
					get_tree().change_scene("res://Main.tscn")
				if selected == 2:
					get_tree().quit()
