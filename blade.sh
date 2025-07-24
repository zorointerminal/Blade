#!/bin/bash

# blade.sh - Simple YouTube downloader for non-tech users

# Color-safe tput fallback
if ! command -v tput &> /dev/null; then
  tput() { :; }
fi

bold=$(tput bold)
normal=$(tput sgr0)
dim=$(tput dim)
green=$(tput setaf 2)   # ✅ Success
red=$(tput setaf 1)     # ✅ Errors
yellow=$(tput setaf 3)  # ✅ Warnings or headings
blue=$(tput setaf 6)    # ✅ Titles / emojis (cyan-ish)

# ✅ Check dependencies
if ! command -v yt-dlp &> /dev/null; then
  echo "${red}❌ yt-dlp not found. Install: https://github.com/yt-dlp/yt-dlp${normal}"
  exit 1
fi

if ! command -v ffmpeg &> /dev/null; then
  echo "${red}❌ ffmpeg not found. Install: sudo apt install ffmpeg${normal}"
  exit 1
fi

if ! ping -q -c 1 youtube.com &> /dev/null; then
  echo "${red}❌ No internet connection. Please check your network.${normal}"
  exit 1
fi

clear


# ╭──────────── Header Box ────────────╮
echo "${blue}${bold}╭────────────────────────────────────────────╮"
echo "│ 🗡️  ${bold}BLADE${normal}${blue} — YouTube Video Downloader v1.3     │"
echo "╰────────────────────────────────────────────╯${normal}"
echo "${dim}Terminal tool to slice YouTube videos clean — fast, minimal, no ads${normal}"
echo

# 📎 Ask for link
echo "${blue}📎 Paste YouTube video link:${normal}"
read url

if [ -z "$url" ]; then
  echo "${red}❌ No URL entered. Please try again.${normal}"
  exit 1
fi

echo
echo "🔍 Verifying link..."

check_output=$(yt-dlp -F "$url" 2>&1)

# Check for errors
if echo "$check_output" | grep -qiE "DRM|ERROR:.*not.*supported"; then
  echo
  echo "${red}❌ Sorry, this link is not supported. Blade currently works with YouTube videos only.${normal}"
  exit 1
else
  echo "${green}✔️  Verified!${normal}"
fi

echo
echo "🔍 Getting formats..."
yt-dlp -F "$url"

echo
echo "🎯 Enter format code (e.g. 22 or 137+140):"
read format

if [ -z "$format" ]; then
  echo "${red}❌ No format selected. Exiting.${normal}"
  exit 1
fi

if ! echo "$format" | grep -Eq '^[0-9]+([+][0-9]+)?$'; then
  echo "${red}❌ Invalid format code. Use numbers like 22 or 137+140.${normal}"
  exit 1
fi


# Fetch video title BEFORE asking for save location
echo
echo "Fetching video title..."
video_title=$(yt-dlp --get-title "$url" 2>/dev/null)

# Debug check
echo "Fetched Title: $video_title"

# Fallback: if title not found, use safe default
if [ -z "$video_title" ]; then
  echo "⚠️ Couldn't fetch video title. Using default name."
  timestamp=$(date +%s)
  video_title="youtube_video_$timestamp"
fi

# Sanitize filename
safe_title=$(echo "$video_title" | sed 's/[\/:*?"<>|]/_/g')

# 📂 Auto-save to ~/Downloads/
save_path="${HOME}/Downloads/${safe_title}.mp4"

echo
echo "⏳ Downloading your video. Sit tight... 🪑"
yt-dlp -f "$format" --quiet --no-warnings --progress "$url"

if ! yt-dlp -f "$format" -o "$save_path" --quiet --no-warnings --progress "$url"; then
  echo "${red}❌ Download failed. Please try a different format or check your internet.${normal}"
  exit 1
fi

echo "📂 Saving to: $save_path"
yt-dlp -f "$format" -o "$save_path" --quiet --no-warnings --progress "$url"

echo
echo "${green}✅ Done! Your blade just sliced the video clean 🎬"


