SHELL := /bin/bash

.PHONY: help 
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

docling-image2text: ## Convert PNG images to markdown text using EasyOCR
	uv run docling --from image --to md --ocr --ocr-lang en --ocr-engine easyocr --force-ocr --tables *.png

easyocr-image2text: ## OCR PNG images and output text with input.png
	uv run Easy-OCR.py
