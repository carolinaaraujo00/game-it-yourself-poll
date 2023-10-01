extends Node

const GAME_SCENE = "res://game/game.tscn"
const MENU_SCENE = "res://main_menu/menu.tscn"

const FAKE_POST_PATH = "res://game/posts/fake/"
const TRUE_POST_PATH = "res://game/posts/true/"

var FAKE_POST_ARRAY = []
var TRUE_POST_ARRAY = []


func _init() -> void:
	# Get all the images from the fake post folder onto the fake post array
	_load_array_with_image_paths(FAKE_POST_ARRAY, FAKE_POST_PATH)
	
	# Get all the images from the true post folder onto the true post array
	_load_array_with_image_paths(TRUE_POST_ARRAY, TRUE_POST_PATH)


func _load_array_with_image_paths(array : Array, path : String) -> void:
	# Go through all the files in a folder
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var filename = dir.get_next()
		
		# While there are still files in said folder
		while filename != "":
			# If they are images, load them onto the array
			if filename.ends_with(".png") or filename.ends_with(".jpg"):
				array.push_back(load(path + filename))
			
			# Get next file in folder
			filename = dir.get_next()
