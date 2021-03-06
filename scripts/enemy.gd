extends KinematicBody2D
var move = Vector2.ZERO
var player = null
var speed = 1

func _physics_process(delta):
	move = Vector2.ZERO
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO
	
	move = move.normalized()
	move = move_and_collide(move)
	
func _on_Area2D_body_entered(body):#Confere se o player está próximo ao agente
	if body.is_in_group("player1"):
		player = body

func _on_Area2D_body_exited(body):#Função que define que se o player estiver longe, ele deve parar de segui-lo
	if body.is_in_group("player1"):
		player = null
	pass
