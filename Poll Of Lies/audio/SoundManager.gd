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
#	print("Node = ", _sound_player_by_name.get("menu_music"))
	var _temp : Node = _sound_player_by_name.get("menu_music")
#	if _temp != null:
#		_temp.play()
