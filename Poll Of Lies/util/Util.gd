extends Node

# SCENE PATHS
const GAME_SCENE = "res://game/game.tscn"
const MENU_SCENE = "res://main_menu/menu.tscn"
const CREDITS_SCENE = "res://credits/credits.tscn"
const END_SCENE = "res://end_screen/end.tscn"

# DIALOGUE
const MAIN_DIALOGUE_PATH = "res://main_menu/dialogue/main.dialogue"
const INTRO_DIALOGUE = "introduction"

# STRINGS
const STR_SCORE : String = "SCORE: "
const STR_WON1 : String = "CONGRATULATIONS!"
const STR_WON2 : String = "You are a master at media literacy!"
const STR_LOST1 : String = "BAH, I KNEW IT!"
const STR_LOST2 : String = "You know better than this, go back in there and try again!"
const STR_FINAL_SCORE : String = "FINAL SCORE:"

# ANIMATIONS
const ANIM_GAME_INTRODUCTION = "game_introduction"
const ANIM_CREDITS = "credits_animation"
const ANIM_FAIL_ARRAY = [
	"first_fail_appear",
	"second_fail_appear",
	"third_fail_appear"
]
const ANIM_WITCH_IDLE = "idle"
const ANIM_CALDRON_SMOKE = "smoke"

# IMAGE PATHS
const FAKE_POST_PATH = "res://game/posts/fake/"
const TRUE_POST_PATH = "res://game/posts/true/"

# ARRAYS TO STORE IMAGES
var FAKE_POST_ARRAY = []
var TRUE_POST_ARRAY = []

var FAKE_POST_ARRAY_COPY
var TRUE_POST_ARRAY_COPY

# PLAYER VARIABLES
var player_has_visited_menu : bool = false
var player_has_won : bool = false
var player_score : int = 0

func _init() -> void:
	FAKE_POST_ARRAY = []
	TRUE_POST_ARRAY = []
	
	FAKE_POST_ARRAY_COPY = []
	TRUE_POST_ARRAY_COPY = []
	
	# Get all the images from the fake post folder onto the fake post array
	_load_array_with_image_paths(FAKE_POST_ARRAY, FAKE_POST_PATH)
	
	# Get all the images from the true post folder onto the true post array
	_load_array_with_image_paths(TRUE_POST_ARRAY, TRUE_POST_PATH)
	
	TRUE_POST_ARRAY_COPY = [] + TRUE_POST_ARRAY
	FAKE_POST_ARRAY_COPY = [] + FAKE_POST_ARRAY


func _load_array_with_image_paths(array : Array, path : String) -> void:
	var check_if_filename_already_exists_in_array = []
	
	# Go through all the files in a folder
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var filename = dir.get_next()
		
		# While there are still files in said folder
		while filename != "":
			filename = filename.replace('.import', '')
			# If they are images, load them onto the array
			if filename.ends_with(".png") or filename.ends_with(".jpg"):
				if !check_if_filename_already_exists_in_array.has(filename):
					check_if_filename_already_exists_in_array.push_back(filename)
					
					array.push_back(load(path + filename))
			
			# Get next file in folder
			filename = dir.get_next()


func reset_arrays() -> void:
	TRUE_POST_ARRAY = [] + TRUE_POST_ARRAY_COPY
	FAKE_POST_ARRAY = [] + FAKE_POST_ARRAY_COPY
	
