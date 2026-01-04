# 📋 Clipboard Monitor (剪贴板监控助手)

[中文](README.md)|[English](README_EN.md)

![Version](https://img.shields.io/badge/version-1.1.1-blue) ![Language](https://img.shields.io/badge/language-AutoHotkey_v2-green) ![Platform](https://img.shields.io/badge/platform-Windows-0078D6)

<div align="center">   <img src="pre.gif" width="600" /> </div>

一个基于 AutoHotkey v2 开发的轻量级 Windows 剪贴板实时监控工具。
专为解决 Windows 剪贴板“不靠谱”（复制失败、粘贴错误）的问题而生，让你直观地看到当前剪贴板里到底存了什么。

> PS. 我是个菜鸟开发者，代码由AI协助完成，这个README也是🫠，主要自用，写的太烂还请嘴下留情

## ✨ 功能特点 (Features)

* **⚡ 实时监控**：每 200ms 自动检测剪贴板变化，所见即所得。
* **🔍 类型识别**：智能识别并显示 `[文本]`、`[图片]`、`[文件]` 等数据类型。
* **🎨 现代化 UI**：
    * 采用 Windows 11 风格设计 (Segoe UI)。
    * 支持 **窗口置顶** ，方便在全屏游戏或多窗口工作时查看。
    * 支持 **透明度调节**，不遮挡视线。
* **🛡️ 容错处理**：针对长文本自动截断显示（预览前 200 字符），防止界面溢出。

## 🚀 使用方法 (Usage)

### 运行方式
1. 双击运行 `clipboard_moni_v1.exe`。

### 界面操作

* **查看内容**：主界面的文本框会实时显示当前剪贴板的文本内容或类型提示。
* **置顶切换**：勾选左下角的“置顶”复选框，保持窗口在最前方。
* **透明度**：拖动右侧滑块，调整窗口透明度。
* **退出**：点击窗口右上角的关闭按钮即可退出程序。

## 🛠️ 开发环境 (Development)

* **语言**: AutoHotkey v2
* **依赖**: 无（使用 Windows 原生 API）

## 📝 更新日志 (Changelog)

**20260104 v1.1.1**

- 删减无用注释
- UpdateClipboardDisplay改为有差异时才更新

**20250826 v1.1.0**

- 右下角添加版本号
- UI整体缩小1/3

**20250821 v1.0.0**

- 初稿

## 📄 License

MIT License