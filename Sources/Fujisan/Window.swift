import WinSDK

public func showMessageBox(title: String, message: String, style: Int32) {
    // 将 Swift String 转换为 WCHAR 数组（Windows 宽字符）
    let wideMessage = message.utf16.map { WCHAR($0) } + [0]
    let wideTitle = title.utf16.map { WCHAR($0) } + [0]

    // 调用 MessageBoxW（使用 inout 传入数组）
    var msg = wideMessage
    var ttl = wideTitle
    MessageBoxW(nil, &msg, &ttl, UINT(style))
}

public func createWindow() {
    // 创建一个窗口类
    let className: [UInt16] = Array("MyWindowClass".utf16) + [0]
    let windowTitle: [UInt16] = Array("最喜欢了".utf16) + [0]

    let classNamePtr: UnsafePointer<UInt16>? = className.withUnsafeBufferPointer { $0.baseAddress }
    let windowTitlePtr: UnsafePointer<UInt16>? = windowTitle.withUnsafeBufferPointer { $0.baseAddress }

    let wc: WNDCLASSW = WNDCLASSW(
        style: UINT(CS_HREDRAW | CS_VREDRAW),
        lpfnWndProc: { hwnd, msg, wParam, lParam in
            switch msg {
            case UINT(WM_DESTROY):
                PostQuitMessage(0)
                return 0
            default:
                return DefWindowProcW(hwnd, msg, wParam, lParam)
            }
        },
        cbClsExtra: 0,
        cbWndExtra: 0,
        hInstance: GetModuleHandleW(nil),
        hIcon: nil,
        hCursor: nil,
        hbrBackground: nil,
        lpszMenuName: nil,
        lpszClassName: classNamePtr
    )

    var wcCopy = wc
    RegisterClassW(&wcCopy)

    // 创建窗口
    let hwnd = CreateWindowExW(
        0,
        classNamePtr,
        windowTitlePtr,
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
        nil, nil, wc.hInstance, nil
    )

    ShowWindow(hwnd, SW_SHOW)
}
