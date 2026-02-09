extends Control

@export var sfx_list: Dictionary[String,AudioStreamWAV]
@export var bgm_list: Dictionary[String,AudioStreamOggVorbis]

func _on_channel_sfx(sfx_key: String, override: bool = true) -> void:
	AudioChannelManager.play_sfx(sfx_list[sfx_key],0, 0.0, override)

func _on_channel_bgm(bgm_key: String) -> void:
	AudioChannelManager.play_music(bgm_list[bgm_key])

func _on_fade_out_channel() -> void:
	AudioChannelManager.fade_music(-60,2)
	await AudioChannelManager.audio_music.tween.finished
	AudioChannelManager.stop_music()

func _on_pool_sfx(sfx_key: String) -> void:
	AudioPoolManager.play_sfx(sfx_list[sfx_key])

func _on_pool_bgm(bgm_key: String) -> void:
	AudioPoolManager.play_music(bgm_list[bgm_key])

func _on_fade_out_pool() -> void:
	AudioPoolManager.fade_music(-60,2)
	await AudioPoolManager.audio_music.tween.finished
	AudioPoolManager.stop_music()

func _stop_sfx() -> void:
	AudioPoolManager.stop_sfx()
	AudioChannelManager.stop_sfx()

func _stop_track() -> void:
	AudioPoolManager.stop_music()
	AudioChannelManager.stop_music()
