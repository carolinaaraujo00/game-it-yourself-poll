# https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html
# To run code in the editor. In this case shows a warning when it's empty
@tool
extends Node

# key, value
var _sound_player_by_name : Dictionary = {}#<string, SoundPlayer()>
var _sound_pool_by_name : Dictionary = {}

var instance : Node

func _ready():
	var menu_music = { "menu_music" : get_node("MenuMusic") }
	_sound_player_by_name.merge(menu_music)
	instance = self


func play_menu_music():
#	var _temp = _sound_player_by_name.get("menu_music") as AudioStreamPlayer
	var _temp = _sound_player_by_name.get("menu_music")
	var _audio
	if _temp != null:
		_audio = _temp.get_child(0)
#	var _tem2p = _sound_player_by_name.get("menu_music")
	if _audio != null:
		_audio.play()

# q: I get this error: Invalid call. Nonexistent function 'play' in base 'Node'.
# a: You need to cast the node to the type you want to use it as. For example:
# var _temp = cast_to(SoundPlayer, _sound_player_by_name.get("menu_music"))
# if _temp != null:

# q: cast_to doesn't work in godot 4.
# a: use as instead of cast_to
# var _temp = _sound_player_by_name.get("menu_music") as AudioStreamPlayer
