# FastSdk
## Description
`FastSdk` is a library that use the fast.com api 
## Use 
```swift 
dependencies: [
  .package(url: "https://github.com/pedroomar23/fast-ios-sdk.git", from: "1.0.0")
]
```
## Install 
- Go to File > Add Package
- Paste Github Link: ```swift "https://github.com/pedroomar23/fast-ios-sdk.git" ```
- Add Package > Select Target > Add 
## Examples 
```swift
  import FastSdk

  let fastApi = FastApi.shared

  func fastResponse() {
    await fastApi.speedTest { result in 
      switch result {
        case let .success(model):
            response = model
        case let .failure(error):
            message = error.localizedDescription
      }
    }
  }
```

