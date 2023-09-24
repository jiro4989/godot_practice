extends AudioStreamPlayer2D

var playback_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream_paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_music() -> void:
	self.play()
	# 途中まで再生した音楽の位置から再開
	self.seek(playback_position)

func stop_music() -> void:
	# 途中まで再生した音楽の位置を記憶
	playback_position = self.get_playback_position()
	self.stop()

func _on_start_music_pressed():
	print("start music")
	play_music()


func _on_stop_music_pressed():
	print("stop music")
	stop_music()
