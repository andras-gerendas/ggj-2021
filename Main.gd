extends Spatial

var bear_summoned = false
var in_dimensional_shift = false
var score = 0

const TREE = preload("res://Tree.tscn")
const TREE3 = preload("res://Tree3.tscn")
const BUSH = preload("res://Bush.tscn")
const ROCK = preload("res://Rock.tscn")

const MONSTER = preload("res://Monster.tscn")
const MONSTER2 = preload("res://Monster2.tscn")
const MONSTER3 = preload("res://Monster3.tscn")

var rng = RandomNumberGenerator.new()

signal dimensional_shift(state)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_ESCAPE:
				get_tree().change_scene("res://Menu.tscn")
			
			var final_vector = Vector3(0, 0, 0)
			
			if event.scancode == KEY_UP:
				final_vector.z -= 1
			if event.scancode == KEY_DOWN:
				final_vector.z += 1
			if event.scancode == KEY_LEFT:
				final_vector.x -= 1
			if event.scancode == KEY_RIGHT:
				final_vector.x += 1
			if event.scancode == KEY_SPACE:
				in_dimensional_shift = not in_dimensional_shift
				bear_summoned = true
				emit_signal("dimensional_shift", in_dimensional_shift)

			if not in_dimensional_shift:
				var collision = $kid.move_and_collide(final_vector.normalized() / 4)
			if not bear_summoned:
				var orig = $kid.transform
				orig = orig.translated(Vector3(0.08, 0, 0.08))
				$bear.transform = orig
			if in_dimensional_shift:
				var collision = $bear.move_and_collide(final_vector.normalized() / 4)
				if collision and len(collision.collider.get_groups()) > 0:
					if collision.collider.get_groups()[0] == "monsters":
						collision.collider.queue_free()
						score += 1
						$CanvasLayer/MarginContainer/VBoxContainer/score.text = "Score: " + str(score)

func _ready():
	rng.randomize()
	$CanvasLayer/MarginContainer/VBoxContainer/score.text = "Score: " + str(score)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	for n in range(0, 45):
		var inst
		if n < 15:
			var type = rng.randi_range(0, 1)
			if type == 0:
				inst = TREE.instance()
			else:
				inst = TREE3.instance()
		elif n < 30:
			inst = BUSH.instance()
		else:
			inst = ROCK.instance()
		var x = rand_range(-20, 30)
		var z = rand_range(-2, -30)
		inst.translate(Vector3(x, 0, z))
		self.add_child(inst)


func _on_Timer_timeout():
	if not in_dimensional_shift:
		$CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/ProgressBar.value += 1
	
	if $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/ProgressBar.value == 100:
		get_tree().change_scene("res://Won.tscn")


func _on_MonsterTimer_timeout():
	var type = rng.randi_range(0, 2)
	var inst
	if type == 0:
		inst = MONSTER.instance()
	elif type == 1:
		inst = MONSTER2.instance()
	else:
		inst = MONSTER3.instance()
	var x = rng.randi_range(-20, 20)
	inst.translate(Vector3(x, 0, -24))
	self.add_child(inst)
