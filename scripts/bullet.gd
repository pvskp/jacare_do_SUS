extends Area2D
var look = null
var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta
	pass

func _on_vacina_area_entered(area):#Deleta a vacina no momento em que ela entra em contato com o virus
	if area.is_in_group("virus") or area.is_in_group("wall"):
		queue_free()
	pass

func _on_vacina_body_entered(body):#Deleta a vacina no momento em que ela entra em contato com os agentes
	if body.is_in_group("trash_can"):
		queue_free()
	pass # Replace with function body.

