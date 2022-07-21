# LipasApp

iOS application build with swift using MVVM architecture and rxLibrary

App uses open API called lipas which contains sport places all around finland
see more (https://www.lipas.fi/etusivu) 

## Getting Started

### Usage 

Clone the repository: 
```
    git clone <url>
```

Go to project root and install pods:
```
    pod install
```
    
You might need to change development team to run app.


## More Info

 - Targets
    - Test: Unit tests made with XCTest framework
    - UITest: Functional tests with XCTest framework (TODO!)
    - App: Lipas is open API so all calls will go to production
        - NOTE - lipas uses http-protocol not (https). App Transport security settings have been changed to allow Arbitary loads
        
    - Pods
        - RxSwift
        - RxCocoa
        - Alamofire
    
