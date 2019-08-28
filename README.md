# Auto Calculate Math Statement

Sample project of iOS

## Using MVVM:
- With `Wireframe` for navigating from / to a screen
- With `Service` for all request used in a screen

![](structures.png)

## Using `Bond` for Binding (https://github.com/DeclarativeHub/Bond)

## Supported by API of MathJS (https://api.mathjs.org)

## Current project is using One-Way and Two-Ways Binding, binding placed in View:
1. Main binding
```swift
func setupBinding() {
    textField.reactive.text.bidirectionalBind(to: viewModel.model.statement)
    viewModel.model.result.bind(to: resultLabel)
    viewModel.showLoading.bind(to: self) { vc, _ in
        vc.showLoading()
    }
    viewModel.hideLoading.bind(to: self) { vc, _ in
        vc.hideLoading()
    }
}
```

2. Two-Ways Binding

Everytime user typing in the `textField`, the value of `statement` in `"ViewModel"` also changed.
```swift
textField.reactive.text.bidirectionalBind(to: viewModel.model.statement)
```

everytime user click the button `"CLEAR"`, it trigger function `reset()` in `"ViewModel"`. This function clear the `statement` in `"ViewModel"`, and also change the `textField` in `"View"`.
```swift
model.statement.value = ""
```

3. One-Way Binding

`result` in ViewModel change `resultLabel` in View:
```swift
viewModel.model.result.bind(to: resultLabel)
```

4. Example of using signal to trigger loading in `"View"` from `"ViewModel"`
```swift
viewModel.showLoading.bind(to: self) { vc, _ in
    vc.showLoading()
}
viewModel.hideLoading.bind(to: self) { vc, _ in
    vc.hideLoading()
}
```

## E. Contain Unit Tests:
- Using `Quick-Nimble` (https://github.com/Quick/Nimble)
- Using `OHTTPStubs` (https://github.com/AliSoftware/OHHTTPStubs)
- Unit Test showcase 

![](UnitTestSchemes.png)

![](UnitTestStructureFiles.png)

## F. Demo:

![](demo.gif)

---
Special thanks to [@ivanrein](https://github.com/ivanrein), [@romin991](https://github.com/romin991), and [@osdudutz](https://github.com/osdudutz)

---
