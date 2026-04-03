SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.ONESHELL:
1-init: ## Initialize and download models
	# Find instructions at https://github.com/nazdridoy/kokoro-tts
	uv add kokoro-tts
	# Download voice data (bin format is preferred)
	wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin
	# Download the model
	wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx

2-test: ## Test TTS
	echo "Hello World" | uv run kokoro-tts - --stream

3-intput-to-output: ## TTS input.txt to output.wav
	uv run kokoro-tts input.txt output.wav --speed 1.2 --lang en-us --voice af_sarah
