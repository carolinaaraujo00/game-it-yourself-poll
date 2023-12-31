extends Node

@onready var _fail_attempt_array = [
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail3/Fail3, 
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail2/Fail2, 
	$MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainerFail1/Fail1]
@onready var _animation_player = $AnimationPlayer
@onready var _left_post = $MarginContainer/VBoxContainer/HBoxContainerPosts/LeftMarginContainer/LeftPost
@onready var _right_post = $MarginContainer/VBoxContainer/HBoxContainerPosts/RightMarginContainer/RightPost
@onready var _score_label = $MarginContainer/VBoxContainer/HBoxContainerScore/MarginContainer/ScoreLabel

var score : int = 0
var number_failed_attempts : int = 0

# Called when this scene starts 
func _ready():
	# Stop music from menu and start game music
	SoundManager.instance.stop_all_audio()
	SoundManager.instance.play_game_music()
	
	reset_variables() 
	
	# Connect to signals of when player selects the correct post
	assert(_left_post.scored_point.connect(update_score) == OK)
	assert(_right_post.scored_point.connect(update_score) == OK)
	
	# Connect to signals of when player selects the incorrect post
	assert(_left_post.failed_attempt.connect(update_fail_attempts) == OK)
	assert(_right_post.failed_attempt.connect(update_fail_attempts) == OK)
	
	# Show score to the player 
	_score_label.text = Util.STR_SCORE + str(score)
	
	# Put images on the right and left post
	assign_random_images_to_posts()


func assign_random_images_to_posts() -> void:
	# 50-50% random chance for the posts to either be true or false, so it doesn't get predictable
	# Remember that when one is true, the other has to be false!
	pass


# These methods work as follows:
# Since we don't know exactly how many items are inside the array, 
# we can create a random number between 0 and the number of items in the array
# which will correspond to a random item of the array. 
# This is done like so: randi() % Util.FAKE_POST_ARRAY.size()
# randi returns a VERY BIG number from 0 to 4294967295 (inclusive), 
# but by dividing it (%) by the number of items in the array, we get a random index!
# the pop_at() method for an array simultaneously returns and removes an item from the array
# so after an image is chosen it can't be chosen again!
# Passing the random index to the pop_at() method for the array does the trick.
func get_random_fake_post():
	return Util.FAKE_POST_ARRAY.pop_at(randi() % Util.FAKE_POST_ARRAY.size())

func get_random_true_post():
	return Util.TRUE_POST_ARRAY.pop_at(randi() % Util.TRUE_POST_ARRAY.size())


func update_score() -> void:
	# Play sound associated with correct answer
	SoundManager.instance.play_correct_sfx()
	
	verify_win_or_loss()


func update_fail_attempts() -> void:
	# Play sound associated with choosing the wrong answer
	SoundManager.instance.play_error_sfx()
	
	# Make the red balls visible, to show the player if they have 1, 2 or 3 failed attempts
	_animation_player.play(Util.ANIM_FAIL_ARRAY[number_failed_attempts])
	await _animation_player.animation_finished
	
	number_failed_attempts += 1 
	verify_win_or_loss()


func verify_win_or_loss() -> void:
	if number_failed_attempts == _fail_attempt_array.size():
		# If the player has reached 3 failed attempts
		# GAME OVER - PLAYER WINS
		Util.player_has_won = false
		Util.player_score = score
		get_tree().change_scene_to_file(Util.END_SCENE)
		
	elif Util.FAKE_POST_ARRAY.is_empty() or Util.TRUE_POST_ARRAY.is_empty():
		# If the player has seen all images 
			# Because each time an image is selected, it is removed, when the arrays are empty
			# It means that the player has gone through all images available
		# GAME OVER - PLAYER LOSES
		Util.player_has_won = true
		Util.player_score = score
		get_tree().change_scene_to_file(Util.END_SCENE)
	
	else:
		# Continue game and update the images to start a new round of guessing which post is true
		assign_random_images_to_posts()

	
func reset_variables() -> void: 
	# Place images back in the arrays
	Util.reset_arrays()
	
	# If the player re-enters the game after losing/winning, all variables have to be reset
	score = 0
	number_failed_attempts = 0
	
	# And failed attempts go back to being invisible
	for attempt in _fail_attempt_array:
		attempt.visible = false
