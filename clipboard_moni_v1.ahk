; 文件名: clipboard_moni_v1.ahk
; 语言: ahk2
; 说明: 剪贴板内容实时监控工具
; 依赖: 无
; 更新历史: 
; 20260104 GnaijUy v1.1.1 删减无用注释
;                         UpdateClipboardDisplay改为有差异时才更新
; 20250826 GnaijUy v1.1.0 调整置顶 透明 署名位置
;                         右下角添加版本号
;                         UI整体缩小1/3
; 20250821 GnaijUy v1.0.0 初稿

#SingleInstance Force  ; 强制单实例运行，避免重复启动多个程序实例

; 创建GUI窗口 - Windows 11风格设计
; +AlwaysOnTop: 窗口置顶   +Border: 窗口边框  +E0x200: 窗口样式扩展标志，提供更平滑的视觉效果和现代感
MyGui := Gui("+AlwaysOnTop +Border +E0x200", "剪贴板监控 by GnaijUy")
MyGui.BackColor := "FFFFFF"  ; 窗口背景色
MyGui.Opt("+LastFound")  ; 设置窗口为最后找到的窗口，便于后续的窗口操作函数调用
WinSetTransparent(100, WinExist())  ; 窗口透明度默认100(0-255范围，0完全透明，255完全不透明)
MyGui.SetFont("s8", "Segoe UI")  ; 全局字体：大小10像素，使用Windows 11默认字体Segoe UI

; 文本编辑框控件 用于显示剪贴板内容
; w h控件宽高  readonly只读  -vscroll移除垂直滚动条  vClipboardContent变量名
MyGui.Add("Edit", "w300 h60 vClipboardContent ReadOnly -VScroll", "")

; 添加置顶窗口复选框（位于布局左侧）
; vAlwaysOnTop 存储复选框状态(true/false)  Checked 默认处于勾选状态
MyGui.Add("CheckBox", "vAlwaysOnTop Checked", "置顶").OnEvent("Click", ToggleAlwaysOnTop)

; 透明度滑块 （位于布局右侧）
; xp yp: 使用上一个控件的位置坐标，实现精确定位   x+20: 水平向右偏移20像素，与左侧控件保持间距    最后为标签内容
MyGui.Add("Text", "x+10", "透明")
; Range50-255: 设置滑块数值范围从50到255     ToolTip: 启用工具提示，鼠标悬停时显示当前值    +AltSubmit: 允许获取精确的数值而不是相对位置
MyGui.Add("Slider", "w80 h20 Range50-255 ToolTip vTransparencyValue +AltSubmit x+0", 100).OnEvent("Change", UpdateTransparency)

; 右下角署名文本
MyGui.Add("Text", "x+10 cGray", "v1.1.1_260104")

; 显示GUI窗口   自动调整窗口大小+居中
MyGui.Show("AutoSize Center")

; 初始显示剪贴板内容 - 程序启动时立即显示当前剪贴板内容
UpdateClipboardDisplay()

; 设置定时器，定期检查剪贴板内容变化
; CheckClipboard: 定时器回调函数名称    200毫秒
SetTimer(CheckClipboard, 200)

; 定时器回调函数
CheckClipboard() {
    UpdateClipboardDisplay() 
}

; 更新剪贴板显示内容的主函数
UpdateClipboardDisplay() {
    static LastClipboardText := "" ; 上次剪贴板内容
    try { 
        clipType := GetClipboardType()   ; 检测类型
        ClipboardText := A_Clipboard  ;  获取当前剪贴板内容 A_Clipboard是AutoHotkey内置的剪贴板变量
        if (ClipboardText = LastClipboardText)   ; 内容无变化则返回
            return
        else
            LastClipboardText := ClipboardText ; 更新

        ; 判断剪贴板是否为空（仅对文本类型进行空值判断）
        if (ClipboardText = "" && clipType = "文本") {
            MyGui["ClipboardContent"].Value := "📭 剪贴板为空"
        } else {
            prefix := "[" clipType "] " ;添加前缀
            ; 长度限制200个字符 超出部分显示省略号
            if (StrLen(ClipboardText) > 200)  ClipboardText := SubStr(ClipboardText, 1, 200) "..."  ; 截取前100字符并添加省略号
            MyGui["ClipboardContent"].Value := prefix . ClipboardText  ; 更新GUI
        }
    }
    ; try块结束后自动处理任何异常，防止程序因剪贴板访问错误而崩溃
}

; 获取剪贴板内容类型函数   使用Windows API检测剪贴板中数据的格式类型
GetClipboardType() {
    if (DllCall("IsClipboardFormatAvailable", "uint", 2))       
        return "图片"  ; 图片(CF_BITMAP = 2)
    else if (DllCall("IsClipboardFormatAvailable", "uint", 15)) 
        return "文件"  ; 文件(CF_HDROP = 15)
    else if (DllCall("IsClipboardFormatAvailable", "uint", 12)) 
        return "音频"  ; 音频(CF_WAVE = 12)
    else if (DllCall("IsClipboardFormatAvailable", "uint", 14)) 
        return "视频"  ; 视频或设备无关位图格式(CF_DIB = 14)
    else 
        return "文本" 
}

; 窗口关闭事件处理函数  当用户点击窗口关闭按钮时触发，安全退出程序
MyGui.OnEvent("Close", (*) => ExitApp())

; 透明度更新函数 - 滑块值变化时自动触发
UpdateTransparency(*) {
    ; 获取滑块当前数值(50-255范围)
    transparency := MyGui["TransparencyValue"].Value
    ; 应用透明度设置到当前窗口
    WinSetTransparent(transparency, WinExist())
}

; 置顶窗口切换函数 - 复选框状态变化时触发
ToggleAlwaysOnTop(*) {
    ; 获取复选框当前选中状态(true/false)
    alwaysOnTop := MyGui["AlwaysOnTop"].Value
    
    ; 根据复选框状态设置窗口置顶属性
    if (alwaysOnTop) {
        WinSetAlwaysOnTop(1, MyGui.Hwnd)
    } else {
        WinSetAlwaysOnTop(0, MyGui.Hwnd)
    }
}
