# List of Swift repositories ordered by popularity (stars count)

## Description

This application have the goal to let the user see all the most popular Swift repoisitories in GitHub. 

Images caption (LTR): 1st - Repositories List; 2nd - Opened/Closed Pull Requests of selected repository; 3rd - Selected pull request hosted in a WebView

<img width="201" height="437" alt="simulator_screenshot_53604BD8-E660-4F32-A943-168412D5247F" src="https://github.com/user-attachments/assets/00b0882f-ee0d-4062-97ef-8589f400e6bf" />
<img width="201" height="437" alt="simulator_screenshot_5A234962-2BD4-4F2D-B881-4C3F98A8CC21" src="https://github.com/user-attachments/assets/99469b80-03b6-4bf7-aeb3-fe138829c3f2" />
<img width="201" height="437" alt="simulator_screenshot_ADACBBF9-30AF-4E82-98E3-F96E78817719" src="https://github.com/user-attachments/assets/9eb7dc4d-fd54-4bb8-a575-7529531561a1" />

1st - In main screen you'll be able to infinite scroll trough popular swift repositories.

2nd - You can click in any card to see all opened and closed Pull Requests for the selected project.

3rd - Also, you can click whatever openned or closed pull requests and the application will host a WebView so you can browse all informations of the clicked item

### Architecture

<img width="772" height="313" alt="image" src="https://github.com/user-attachments/assets/3174b6a5-6e83-4194-a8b4-d0d2b3a51563" />

This project were developed following the MVVM architecture pattern (Diagram above)

## Getting Started

### Dependencies

* [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing)

### Executing program

Clone&Run on Xcode

You can also run the application with instruments for validation purposes... But to cut corners, you can see below a screenshot of instruments with running app.
<img width="800" height="360" alt="Screenshot 2025-11-25 at 20 25 08" src="https://github.com/user-attachments/assets/2d09f94c-b533-464b-9ba2-317713f0cffe" />

### Fastlane

This app are running tests with fastlane. 

<img width="974" height="536" alt="Screenshot 2025-11-25 at 23 56 45" src="https://github.com/user-attachments/assets/3bf6f5b8-c817-4377-ad28-1ba1f2b644e7" />

You just have to run on your terminal ```fastlane tests``` (configured for PopuparSwiftRepositories.xcworkspace and PopuparSwiftRepositoriesTests scheme). 

## Authors

Eduardo Raffi 

[Linkedin](https://www.linkedin.com/in/eduardoraffi/)

## References

Inspiration, code snippets, etc.
* [Apple](https://developer.apple.com/tutorials/swiftui)
* [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project)
* [Medium Nikitabuilds](https://medium.com/@nikitabuilds/simplifying-swiftuis-navigationstack-with-navigationstatemanager-83aaaf8acabf)
* [Routing](https://www.youtube.com/watch?v=GCZ9tFRlVGQ)
* [Shimmer Effect](https://www.youtube.com/watch?v=cmJudhQH_co&t=226s)
* [Kodeco](https://www.kodeco.com/home)
