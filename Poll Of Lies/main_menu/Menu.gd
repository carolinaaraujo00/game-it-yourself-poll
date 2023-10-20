extends Node

@onready var animation_player : AnimationPlayer = $Panel/AnimationPlayer

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	assert(animation_player.animation_finished.connect(_go_to_game) == OK)
	animation_player.play(Util.ANIM_START_PRESSED)
	
func _go_to_game(animation_name):
	if animation_name == Util.ANIM_START_PRESSED:
		get_tree().change_scene_to_file(Util.GAME_SCENE)

func _on_credits_pressed():
	get_tree().change_scene_to_file(Util.CREDITS_SCENE)
