extends Node

@onready var credits_anim_player : AnimationPlayer = $CreditsAnimationPlayer

func _ready():
	credits_anim_player.play(Util.ANIM_CREDITS)
	
func _on_btn_back_to_menu_pressed():
	get_tree().change_scene_to_file(Util.MENU_SCENE)
