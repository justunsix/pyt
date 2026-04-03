# YT-DLP Environment

Creates a Python environment for using
[yt-dlp](https://github.com/yt-dlp/yt-dlp) with its recommended dependencies
according to its manual (readme).

## Requirements

Project will only manage Python dependencies and assumes these other programs on
installed on the system:

- uv - for environment setup
- ffmpeg and ffprobe
- node
- AtomicParsley
- Downloader of your choice, for example aria
- mpv (optional)

## Usage

```sh

# Download a video with yt-dlp
uv run yt-dlp <URL>

# Watch a video with mpv
uv run mpv <URL>

```
