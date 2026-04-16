#!/usr/bin/env bash

echo "Retrieving first clipboard item"
ytdlpformat="--ytdl-format=bv[height<=1080][vcodec!~='^(vp0?9)']+ba/b[height<=1080]"
link=$(xsel -ob)
uv run mpv "$ytdlpformat" "$link"
