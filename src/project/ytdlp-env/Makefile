.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.ONESHELL:
init: ## Initialize environment
	# https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file
	# as of 2026-04-02
	uv venv
	uv add yt-dlp
	# Requirements
	### ffmpeg, ffprobe
	### nodejs
	###
	### for YouTube support
	uv add yt-dlp-ejs
	# Networking
	### root certificates
	uv add certifi
	### Encoding
	uv add brotli
	### Downloading
	uv add websockets
	### HTTP library
	uv add requests
	# Impersonation
	uv add curl_cffi
	# Metadata
	### thumbnail
	uv add mutagen
	### AtomicParsley
	### xattr metadata
	uv add xattr
	# Other
	### Decryption of streams
	uv add pycryptodome
	# Downloader (optional)
	### aria

view-video: ## View video
	./view-video.sh
