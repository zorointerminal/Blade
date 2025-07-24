# 🗡️ Blade — YouTube Video Downloader

> Slice YouTube videos clean, fast & ad-free — right from your terminal.

Blade is a beginner-friendly CLI tool designed for Linux users who want to download YouTube videos easily using just a command-line interface — no need to remember long yt-dlp commands.

🎬 Whether you're a non-tech user or a minimalist, Blade gives you full control over video format selection, title auto-detection, and error handling in one clean Bash script.

## ✨ Features

- 🗡️ **Minimal & Fast** — No fluff, no ads, just clean downloads.
- 📦 **Works in Terminal** — Zero GUI needed. Perfect for devs & power users.
- 🎯 **Custom Format Selection** — Choose exactly what quality to download.
- 🎥 **Auto Video Title Detection** — Saves videos with proper titles.
- 💾 **Auto-Save to Downloads** — Files go straight to your ~/Downloads.
- 🚫 **No Bloat** — No tracking, no extra dependencies.


## 🛠️ Installation (Linux Only)

Follow these steps to get Blade running on your system:

### 1. 📥 Clone the Repository

```bash
git clone https://github.com/zorointerminal/Blade.git
cd Blade

---

### 2. ✅ Make the Script Executable

```bash
chmod +x blade.sh

---

### 3. ⚙️ (Optional) Set as Global Command

To use blade from anywhere in terminal:

```bash
sudo cp blade.sh /usr/local/bin/blade

Now just type blade from anywhere!

---

### ⚠️ Dependencies

Make sure these tools are installed:

```bash
sudo apt update
sudo apt install yt-dlp ffmpeg

### 🧪 Test It!

```bash
blade

---

## 📸 Demo

Here’s how Blade works — minimal, fast, and clean:

---

### 🔹 1. Start & Verify

![Blade Start](assets/blade-start.png)

---

### 🔹 2. Available Formats

**Step 1: Blade shows available formats with video/audio quality details**

![Blade Formats - Step 1](assets/blade-formats.png)

**Step 2: You can pick format code like `137+140` (video + audio)**

![Blade Formats - Step 2](assets/blade-formats-2.png)


---

### 🔹 3. Downloading...

![Blade Downloading](assets/blade-downloading.png)

---

### 🔹 4. Done!

![Blade Finished](assets/blade-finished.png)

---

---

## 🧠 FAQ / Troubleshooting

**Q: It says yt-dlp or ffmpeg not found?**
> Run this in your terminal:
> ```bash
> sudo apt install yt-dlp ffmpeg
> ```

**Q: It shows DRM error or 'not supported'?**
> Blade supports only YouTube videos currently. DRM-protected sites like Netflix, Spotify, etc. are not supported.

**Q: Where is my video saved?**
> Videos are auto-saved to:  
> `~/Downloads/<YouTubeTitle>.mp4`

**Q: Getting 'invalid format code'?**
> Make sure you're entering something like `22` or `137+140`. These are shown in the format list Blade displays.


---

## 📜 License

Blade is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this tool.

---

## 💬 Feedback & Suggestions

Loved Blade? Got ideas for improvements?  
Reach out here:

- X (Formerly 🐦 Twitter): [@zorointerminal](https://x.com/zorointerminal)  

---
