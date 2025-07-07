extends Control

@export var audio_test: AudioStreamWAV
@export var audio_test2: AudioStreamOggVorbis

func _on_channel_sfx() -> void:
	AudioManager2.play_sfx(audio_test,0)

func _on_channel_sfx_cut() -> void:
	AudioManager2.play_sfx(audio_test,0,0.0, false)

func _on_channel_track() -> void:
	AudioManager2.play_music(audio_test2)

func _on_pool_sfx() -> void:
	AudioManager.play_sfx(audio_test)

func _on_pool_track() -> void:
	AudioManager.play_music(audio_test2)

func _on_fade_out_channel() -> void:
	AudioManager2.fade_music(-60,2)
	await AudioManager2.audio_music.tween.finished
	AudioManager2.stop_music()

func _on_fade_out_pool() -> void:
	AudioManager.fade_music(-60,2)
	await AudioManager.audio_music.tween.finished
	AudioManager.stop_music()

func _stop_sfx() -> void:
	AudioManager.stop_sfx()
	AudioManager2.stop_sfx()

func _stop_track() -> void:
	AudioManager.stop_music()
	AudioManager2.stop_music()
