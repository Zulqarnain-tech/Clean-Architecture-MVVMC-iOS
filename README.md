# Clean Architecture Example Project.
This project is an example of clean architecture by Uncle Bob. Clean architecture is set of
guidelines, Software patterns, SRP and communication between modules. It clears boundary between
its layers with a strong focus on maintaining separation of concerns and making code more testable.


## Layers
- Presentation layer.
- Domain layer.
- Data layer.

### Presentation layer:
It manages the UI actions of the app. I am using MVVM (UI design pattern) to manage this
layer. The UI (UIViewController, UIView) interacts with ViewModels. View Models deal with Use Cases
which are the part of Domain layer.

### Domain layer:
It contains Entities, Use Cases (both the interface & implementation) & Repository interfaces.
Entities contain the domain models, essential properties and methods that only represent the
business concepts.

### Data layer:
It contains the implementation of Repository, Networks and DTOs (Data transfer Objects responsible
for mapping). Repositories deals with all kind of sources like local storage or Remote Services
(APIs, Firebase, AWS services etc).





## Contributions Wanted
I have added a few test cases. There are more uses cases that need to be tested. Other than test cases, further code level improvements can be done. Feel free to do that.




## Installation
I am using **SDWebImage** for displaying the images in the list.

```swift
pod 'SDWebImage', '~> 5.0'
```



## Disclaimer:
This project is open-source and freely available for use in any capacity. Please be aware that the
author is not responsible for any issues or consequences that may arise from its usage in
production applications or any other type of project. Use this project at your own discretion and
risk.
