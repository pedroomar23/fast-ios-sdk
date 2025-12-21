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
```swift
Add FastSdk to your project Project > PackageDependencies > Page Library Link > Select Target Name > Add
import FastSdk
```
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

