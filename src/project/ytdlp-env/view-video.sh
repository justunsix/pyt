#!/usr/bin/env bash
set -euo pipefail

# Retrieve the current clipboard contents (X11 selection: primary, secondary, or clipboard)
echo "Retrieving clipboard contents..."
link=$(xsel -ob)

if [[ -z "$link" ]]; then
  echo "Error: Clipboard is empty. Copy a video URL first." >&2
  exit 1
fi

echo "Clipboard: $link"

maxresolution="720"

# yt-dlp format selection for mpv
# Strategy: prefer separate video+audio streams over single file for quality
# - bv[height<=720][vcodec!~='^(vp0?9)']+ba : best video (≤720p, not VP9) + best audio
# - b[height<=720] : fallback to best single file ≤720p
# Excludes VP9 for broader hardware decode compatibility
# Caps resolution at 720p to limit download size
ytdlpformat="--ytdl-format=bv[height<=$maxresolution][vcodec!~='^(vp0?9)']+ba/b[height<=$maxresolution]"

echo "Launching mpv with yt-dlp format: $ytdlpformat"
uv run mpv "$ytdlpformat" "$link"
