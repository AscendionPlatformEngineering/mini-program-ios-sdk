# 🧩 MiniProgramSDK

`MiniProgramSDK` is a lightweight, extensible XCFramework built to load and communicate with JavaScript-powered **mini-apps** inside a `WKWebView`. It provides a secure and testable **JavaScript bridge architecture**, and supports both Swift and Objective-C integrations.

---

## 🚀 Features

- ✅ Swift compatible  
- ✅ JavaScript bridge for native↔web communication  
- ✅ Supports HTML entry points from local or remote URLs  
- ✅ Pluggable JSAPI registry for custom handler injection  
- ✅ Fully testable and protocol-driven architecture  
- ✅ Extensible with dynamic handler registration

---

## 📦 Installation

### ➕ Swift Package Manager (SPM)

You can integrate via **SPM**:

1. In Xcode, go to `File` → `Add Packages…`
2. Enter the repo URL:
   ```
   https://github.com/CollaberaDigital/iOS_Mini_Program_SDK.git
   ```
3. Select the latest version or branch.
4. Import it:
   ```swift
   import MiniProgramSDK
   ```

---

## 🧑‍💻 Usage

### 🔹 Step 1: Create a Configuration

```Swift
let config = MiniAppConfigurations(
    appId: "remoteMiniApp",
    entryHtmlPath: "https://mini-app-5713b.web.app/",
    payload: """
    {
        "id": "1",
        "name": "Joe Doe",
        "email": "john@example.com"
    }
    """
)
```

### 🔹 Step 2: Launch the MiniApp ViewController

UIKit

```swift
let controller = MiniAppViewController(configuration: config)
present(controller, animated: true)
```

SwiftUI

```swift
struct ContentView: View {
    var body: some View {
        MiniAppContainerView(configuration: myMiniAppConfig)
            .edgesIgnoringSafeArea(.all) // Optional: if you want fullscreen
    }
}
```

---

## 🛠 JavaScript Bridge API

You can invoke native methods from the web using:

```js
window.webkit.messageHandlers.native.postMessage({
  method: "auth.getToken",
  callbackId: "cb_123",
  params: {}
});
```

---

## 🔌 Custom JSAPI Handlers

You can inject your own JSAPI handlers via the registry:

```swift
let customHandler = APIHandler(method: .uiOpenSheet) { params, callbackId, webView in
    JSAPIDispatcher.postResult(
        webView: webView,
        callbackId: callbackId,
        status: "success",
        result: "Sheet opened"
    )
}

let registry = APIRegistry()
registry.register(handler: customHandler)

let controller = MiniAppViewController(
    configuration: config,
    registry: registry
)
```

---

## 🧪 Testing

All components are testable with mocked dependencies:

- `JSBridgeProtocol`
- `JSAPIRegistry`
- Individual `JSAPIHandler`s

Use dependency injection and unit tests to verify handler invocations and JS bridge behavior.

---

## 📁 Folder Structure (Framework)

```
MiniProgramSDK/
├── MiniAppViewController.swift
├── JSAPIBridge.swift
├── JSAPIDispatcher.swift
├── JSAPIRegistry.swift
├── APIHandler.swift
├── MiniAppConfigurations.swift
├── JSAPIMethodName.swift
├── Handlers/
│   ├── AuthHandler.swift
│   ├── UserHandler.swift
│   └── DeviceHandler.swift
```

---

## 📜 License

MIT License
