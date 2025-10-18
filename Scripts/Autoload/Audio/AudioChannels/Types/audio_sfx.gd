class_name ChannelSFX
extends AudioChannels

# Used to play sound effects
func play(resource: AudioStreamWAV, id: int, volume: float, override: bool) -> void:
	var player: AudioStreamPlayer = select_player(resource, id, override)
	if player:
		player.volume_db = volume
		player.call_deferred("play")

# Used to stop all sound effects
func stop() -> void:
	for player in audio_players:
		player.stream = null
