extends Node

@onready var animation_player : AnimationPlayer = $Panel/AnimationPlayer
@onready var button_container : VBoxContainer = $Panel/VBoxContainer


func _ready() -> void: 
	assert(animation_player.animation_finished.connect(_anim_finished) == OK)
	assert(DialogueManager.dialogue_ended.connect(_on_dialogue_end) == OK)
	
	if !Util.player_has_visited_menu:
		animation_player.play(Util.ANIM_GAME_INTRODUCTION)
	else: 
		button_container.visible = true

# The following functions are connected via Godot's interface to be called upon 
# a certain action, for example: when the player clicks the start button.
# Therefore, each function is specific to one action, dealing with it accordingly. 
#
# When the player clicks the quit button, exit the game
func _on_quit_pressed() -> void:
	get_tree().quit()


# When player clicks the credits button, go to the credits scene
func _on_credits_pressed():
	get_tree().change_scene_to_file(Util.CREDITS_SCENE)


func _on_start_pressed():
	get_tree().change_scene_to_file(Util.GAME_SCENE)


func _anim_finished(animation_name):
	# If the introduction animation finished
	if animation_name == Util.ANIM_GAME_INTRODUCTION:
		# Start dialogue 
		DialogueManager.show_example_dialogue_balloon(load(Util.MAIN_DIALOGUE_PATH), Util.INTRO_DIALOGUE)


func _on_dialogue_end(_arg): 
	Util.player_has_visited_menu = true
	button_container.visible = true

