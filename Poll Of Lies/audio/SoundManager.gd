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
const WITCH_LAUGH_SFX = "witch_laugh_sfx"
const FIRE_SFX = "fire_sfx"
const BUBBLES_SFX = "bubbles_sfx"


func _ready():
	# Create a dictionary entry for the "menu_music" sound player
#	var menu_music = { MENU_MUSIC : $MenuMusic }
#	var witch_laugh_sfx = { WITCH_LAUGH_SFX : $MainMenuAudio/WitchLaugh }
#	var fire_sfx = { FIRE_SFX : $MainMenuAudio/Fire }
#	var bubbles_sfx = { BUBBLES_SFX : $MainMenuAudio/Bubbles }
#	_sound_player_by_name.merge(menu_music)
#	_sound_player_by_name.merge(witch_laugh_sfx)
#	_sound_player_by_name.merge(fire_sfx)
#	_sound_player_by_name.merge(bubbles_sfx)
	add_to_sound_player_dictionary(MENU_MUSIC, $MenuMusic)
	add_to_sound_player_dictionary(WITCH_LAUGH_SFX, $MainMenuAudio/WitchLaugh)
	add_to_sound_player_dictionary(FIRE_SFX, $MainMenuAudio/Fire)
	add_to_sound_player_dictionary(BUBBLES_SFX, $MainMenuAudio/Bubbles)
	
	# Store itself to be avaiable in instance. this is used to call functions
	# of the script
	instance = self

func add_to_sound_player_dictionary(name, node):
	_sound_player_by_name[name] = node

# Function to check if nodes were added correctly to the sound manager
# if everything is ok, retrieves the node with the sound, ready to be played 
func get_child_if_exists(node_name) -> AudioStreamPlayer:
	var _node_child
	var _node = _sound_player_by_name.get(node_name)
	
	if _node == null:
		# If the node does not exist in the dictionary, return null
		return null
	else:
		# Check if the child node at index 0 exists and is an AudioStreamPlayer
		_node_child = _node.get_child(0)
		if _node_child != null and _node_child is AudioStreamPlayer:
			# If node exists and is AudioStreamPLayer, return the child node
			return _node_child
		else:
			# If one of the above is false, returns null (empty)
			return null
	
# Stop all menu music
#func stop_menu_music():

	
	
	
# Plays the menu music if it exists
func play_menu_music():
	# Get the "menu_music" child node if it exists and is an AudioStreamPlayer
	var _menu_music = get_child_if_exists("menu_music")
	
	if _menu_music != null:
		# If the child node exists, play the menu music
		if !_menu_music.is_playing():
			_menu_music.play()
	
	
func play_witch_laugh_sfx():
	# Get the "menu_music" child node if it exists and is an AudioStreamPlayer
	var witch_laugh_sfx = _sound_player_by_name.get(WITCH_LAUGH_SFX)
	
	if witch_laugh_sfx != null:
		# If the child node exists, play the menu music
		witch_laugh_sfx.play()


func play_fire_sfx():
	var fire_sfx = _sound_player_by_name.get(FIRE_SFX)
	
	if fire_sfx != null:
		if !fire_sfx.is_playing():
			fire_sfx.play()
	
		
func play_bubbles_sfx():
	var bubbles_sfx = _sound_player_by_name.get(BUBBLES_SFX)
	
	if bubbles_sfx != null:
		if !bubbles_sfx.is_playing():
			bubbles_sfx.play()
		
