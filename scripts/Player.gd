extends KinematicBody2D

var motion = Vector2()
export var speed = 100
var prevac = preload("res://level design/level 1/bullet.tscn")
#export (PackedScene) var vacina
#onready var vacina = preload("res://level design/level 1/bullet.tscn")
var vac_speed = 50
var timing = 0.4
var shot = 0
var delta = delta
onready var timer = $VacDelay
var vac_delay = 1
var flip = false

func _process(delta):
	flip_char()
	pass

func _physics_process(delta):
	#look_at(get_global_mouse_position())
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_up"):
		motion.y = -speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_down"):
		motion.y = speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_mouse_left_click") and timer.is_stopped():
		timer.start(vac_delay)
		shooting()
	else:
		motion.x = 0
		motion.y = 0
		
func flip_char():
	var mouse_pos = get_global_mouse_position()
	var sprite_pos = $sprite.get_global_position()
	if mouse_pos[0] < sprite_pos[0]:
		$sprite.set_flip_h(false)
		flip = false
	else:
		$sprite.set_flip_h(true)
		flip = true
	pass
func shooting():
	var vac = prevac.instance()
	var vac_pos = null
	owner.add_child(vac)
	if flip == true:
		vac_pos = $vacpos1
	else:
		vac_pos = $vacpos2
	vac.set_global_position(vac_pos.get_global_position())
	#vac.set_rotation($".".get_rotation())
	vac.look_at(get_global_mouse_position())
	pass
