# 📋 Clipboard Monitor

<div align="center">
[![Chinese](https://img.shields.io/badge/Language-中文-red)](README.md)
[![English](https://img.shields.io/badge/Language-English-blue)](README_EN.md)

</div>

![Version](https://img.shields.io/badge/version-1.1.1-blue) ![Language](https://img.shields.io/badge/language-AutoHotkey_v2-green) ![Platform](https://img.shields.io/badge/platform-Windows-0078D6)

<div align="center">   <img src="pre.gif" width="600" /> </div>

A lightweight real-time Windows clipboard monitoring tool developed with AutoHotkey v2.
Designed to solve the "unreliable" Windows clipboard issues (copy failures, wrong pastes) by giving you a direct view of what is currently stored in your clipboard.

> **Note:** I am a beginner developer. This code and README were generated with AI assistance 🫠. Created mainly for personal use—please go easy on me!

## ✨ Features

* **⚡ Real-time Monitoring**: Automatically detects clipboard changes every 200ms. What you see is what you get.
* **🔍 Type Recognition**: Intelligently identifies and displays data types such as `[Text]`, `[Image]`, `[File]`, etc.
* **🎨 Modern UI**:
    * Designed with **Windows 11 style** (Segoe UI).
    * Supports **"Always on Top"**, convenient for full-screen gaming or multi-window multitasking.
    * Supports **Transparency adjustment** to avoid blocking your view.
* **🛡️ Fault Tolerance**: Automatically truncates long text (previews the first 200 characters) to prevent UI overflow.

## 🚀 Usage

### How to Run
1. Double-click `clipboard_moni_v1.exe` to launch.

### Interface Controls

* **View Content**: The text box in the main interface displays the current clipboard text or type hint in real-time.
* **Toggle Top**: Check the "Always on Top" box (bottom left) to keep the window in the foreground.
* **Transparency**: Drag the slider (right side) to adjust window transparency.
* **Exit**: Click the close button [X] in the top right corner to quit the program.

## 🛠️ Development Environment

* **Language**: AutoHotkey v2
* **Dependencies**: None (Uses Windows Native API)

## 📝 Changelog

**2026-01-04 v1.1.1**
- Removed redundant comments.
- Optimized `UpdateClipboardDisplay`: UI now only refreshes when content actually changes.

**2025-08-26 v1.1.0**
- Added version number to the bottom right.
- Reduced overall UI size by 1/3.

**2025-08-21 v1.0.0**
- Initial Draft.

## 📄 License

MIT License