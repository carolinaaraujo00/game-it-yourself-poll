# https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html
# To run code in the editor. In this case shows a warning when it's empty
@tool
extends Node

# Note, this class is called a singleton and it's a concept hard to understand, 
# but in simpler terms for this project think of this sound manager like this:

# In programming, a singleton is piece of code that no matter where you use it in the program, 
# there's only ever one of it.
# So, a singleton in programming is a way to make sure there's only one of something important, 
# just like our one unique sound manager that contains all the sounds in the game.
# This is important to help the game running smoothly and run in many computers


# Dictionary to store each SoundPlayer nodes by its name
var _sound_player_by_name : Dictionary = {}#<string, SoundPlayer()>
var _sound_pool_by_name : Dictionary = {}

# Reference to the itself, so it just exists one
var instance : Node

# Constant Names for nodes with audio
const MENU_MUSIC = "menu_music"
const GAME_MUSIC = "game_music"
const WITCH_LAUGH_SFX = "witch_laugh_sfx"
const FIRE_SFX = "fire_sfx"
const BUBBLES_SFX = "bubbles_sfx"

const CLICK_SFX = "click_sfx"
const CORRECT_SFX = "correct_sfx"
const ERROR_SFX = "error_sfx"


func _ready():
	# Store itself to be avaiable in instance. this is used to call functions
	# of the script
	instance = self
	
	add_to_sound_player_dictionary(MENU_MUSIC, $MenuMusic/MenuMusic)
	add_to_sound_player_dictionary(WITCH_LAUGH_SFX, $MainMenuAudio/WitchLaugh)
	add_to_sound_player_dictionary(FIRE_SFX, $MainMenuAudio/Fire)
	add_to_sound_player_dictionary(BUBBLES_SFX, $MainMenuAudio/Bubbles)

	add_to_sound_player_dictionary(GAME_MUSIC,$GameMusic/GameMusic)
	add_to_sound_player_dictionary(CLICK_SFX, $UIAudio/Click)
	add_to_sound_player_dictionary(CORRECT_SFX, $UIAudio/Correct)
	add_to_sound_player_dictionary(ERROR_SFX, $UIAudio/Error)
	
	

func add_to_sound_player_dictionary(name, node):
	_sound_player_by_name[name] = node

	
# Stop all menu music
func stop_menu_audio():
	var _sound_player_keys = Array(_sound_player_by_name.keys())
	
	for i in _sound_player_keys:
		_sound_player_by_name.get(i).stop()
	
# GAME
func play_game_music():
	play_audio(GAME_MUSIC)
	
# UI
func play_click_sfx():
	play_audio(CLICK_SFX)
	
func play_correct_sfx():
	play_audio(CORRECT_SFX)
	
func play_error_sfx():
	play_audio(ERROR_SFX)
	
# Menu

# Plays the menu music if it exists
func play_menu_music():
	play_audio(MENU_MUSIC)
	
func play_witch_laugh_sfx():
	play_audio(WITCH_LAUGH_SFX)

func play_fire_sfx():
	play_audio(FIRE_SFX)
	
func play_bubbles_sfx():
	play_audio(BUBBLES_SFX)
		
		
# Generic
func play_audio(audio_name):
	# Get the "menu_music" child node if it exists and is an AudioStreamPlayer
	var audio_node = _sound_player_by_name.get(audio_name)
	
	if audio_node != null:
		# If the child node exists, play the menu music
		if !audio_node.is_playing():
			audio_node.play()
