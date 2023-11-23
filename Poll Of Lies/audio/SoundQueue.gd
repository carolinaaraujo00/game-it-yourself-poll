extends Node

@export var count : int = 1

# underscore means that the variable is private, it is a way to let us, programmers,
# know that the variable is only meant to be used inside this script

# here it's created an array of all the audios that will be played
# we will get the next audio on the list and play it
var _audio_stream_players : Array = []
var _next : int = 0

# https://www.youtube.com/watch?v=bdsHf08QmZ4&t=342s
func _ready():
	
	# At the start, check to see if the SoundQueue has any audio to play
	# if not, it warns the programmer
	if get_child_count() == 0:
		print("[Warning] No AudioStreamPlayer child was found.")
	
	var _child = get_child(0)
	# check if the first child node of SoundQueue scene is an AudioStreamPlayer
	if _child is AudioStreamPlayer:
		# if it is a AudioStreamPlayer
			# Appends(adds) an element at the end of the array 
		_audio_stream_players.append(_child)
		
		for i in range(count):
			var duplicate : AudioStreamPlayer = _child.duplicate() as AudioStreamPlayer
			add_child(duplicate)
			_audio_stream_players.append(duplicate)

func play_sound():
	if _audio_stream_players[_next].playing:
		_audio_stream_players[_next + 1].play()
		_next %= _audio_stream_players.count()
		
