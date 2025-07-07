extends Node2D
class_name AudioChannels

var audio_players: Array[AudioStreamPlayer] = []

# Used to setup the Audio Channels
func _init(audio_bus: String, amount: int) -> void:
	for i in amount:
		var player: AudioStreamPlayer = AudioStreamPlayer.new()
		add_child(player)
		audio_players.append(player)
		player.bus = audio_bus
		player.finished.connect(on_player_finished.bind(player))

# Used to select an audio player and return it if it's unused
func select_player(resource: AudioStream, id: int = 0, override: bool = true) -> AudioStreamPlayer:
	var player: AudioStreamPlayer = audio_players[id]
	if not override:
		if player.has_stream_playback():
			return
	
	player.stream = resource
	return player

func on_player_finished(player: AudioStreamPlayer) -> void:
	player.stream = null
