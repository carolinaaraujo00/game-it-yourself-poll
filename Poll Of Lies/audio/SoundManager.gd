extends Node
# Note, this class is called a Singleton - think of this Sound Manager like this:

# In programming, a Singleton is a class of which there is only one instance. So this 
# game has one and one only SoundManager. Everytime we need to play a sound 
# we do it through this manager! This is important to help the game running smoothly.

# Dictionary to store each SoundPlayer nodes by their names
var _sound_player_by_name : Dictionary = {}

# Reference to the itself, so only one exists
var instance : Node

# AUDIO FOR THE MENU
const MENU_MUSIC = "menu_music"
const WITCH_LAUGH_SFX = "witch_laugh_sfx"
const MENU_AMBIENCE = "ambience_menu"

# AUDIO FOR THE GAME
const GAME_MUSIC = "game_music"
const CLICK_SFX = "click_sfx"
const CORRECT_SFX = "correct_sfx"
const ERROR_SFX = "error_sfx"

# AUDIO FOR END GAME
const WIN_SOUND = "win_sound"
const LOSS_SOUND = "loss_sound"

func _ready():
	instance = self
	
	# Add audio for the menu and game to the dictionaries
	add_to_sound_player_dictionary(MENU_MUSIC, $MenuMusic/MenuMusic)
	add_to_sound_player_dictionary(WITCH_LAUGH_SFX, $MainMenuAudio/WitchLaugh)
	add_to_sound_player_dictionary(MENU_AMBIENCE, $MainMenuAudio/ambience_menu)

	add_to_sound_player_dictionary(GAME_MUSIC,$GameMusic/GameMusic)
	add_to_sound_player_dictionary(CLICK_SFX, $UIAudio/Click)
	add_to_sound_player_dictionary(CORRECT_SFX, $UIAudio/Correct)
	add_to_sound_player_dictionary(ERROR_SFX, $UIAudio/Error)
	
	add_to_sound_player_dictionary(WIN_SOUND, $GameEnd/WinSound)
	add_to_sound_player_dictionary(LOSS_SOUND, $GameEnd/LossSound)


func add_to_sound_player_dictionary(node_name, node):
	_sound_player_by_name[node_name] = node


# Plays the requested audio, if avaiable
func play_audio(audio_name):
	# Check if the passed audio exists in the dictionaries
	var audio_node = _sound_player_by_name.get(audio_name)
	
	# If audio_node exists and is not playing already, play audio
	if _sound_player_by_name.get(audio_name) != null and audio_node.is_playing():
		# If it is playing, stop it and play it again 
		audio_node.stop()
	audio_node.play()


# Stop all menu music
func stop_menu_audio():
	for i in Array(_sound_player_by_name.keys()):
		_sound_player_by_name.get(i).stop()

func play_win_sound():
	_sound_player_by_name[WIN_SOUND].play()

func play_loss_sound():
	_sound_player_by_name[LOSS_SOUND].play()

func stop_game_music():
	_sound_player_by_name[GAME_MUSIC].stop()

func play_game_music():
	play_audio(GAME_MUSIC)

func play_click_sfx():
	play_audio(CLICK_SFX)

func play_correct_sfx():
	play_audio(CORRECT_SFX)

func play_error_sfx():
	play_audio(ERROR_SFX)

func play_menu_music():
	play_audio(MENU_MUSIC)

func play_witch_laugh_sfx():
	play_audio(WITCH_LAUGH_SFX)

func play_menu_ambience():
	play_audio(MENU_AMBIENCE)
