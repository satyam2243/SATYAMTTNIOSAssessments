import UIKit

//1-Explain what is Xcode?

/*
 Xcode is Apple's integrated development environment (IDE) that you use to build apps for Apple products including the iPad, iPhone, Apple Watch, and Mac. Xcode provides tools to manage your entire development workflow—from creating your app, to testing, optimizing, and submitting it to the App Store.
 
 */


//2- Explain how you can add frameworks in Xcode project?

/*
 1-> Select "Show the Project navigator"
 2-> Right-click on the project folder you wish to add the framework to.
 3-> Select 'Add Files to "YourProjectName"'
 4-> Browse to the framework - generally under /Developer/SDKs/MacOSXversion.sdk/System/Library/Frameworks
 5-> Select the one you want.
 6-> Select "Add"
 It will appear in both the project navigator where you want it, as well as in the "Link Binary With Libraries" area of the "Build Phases" pane of your target.
 */


//3- Explain what is the difference between Xcode, Cocoa and Objective C?

/*
 Xcode is the integrated development environment (IDE)—the application—that developers use to write software for iOS and/or OS X. It includes the editor, the build system (determining what to build to produce the desired target), and quite a few other things.

 Objective-C is the main language that developers write such software in. They may write bits of it in pure C, use C++ or combine it with Objective-C (producing Objective-C++), or write some or all of the program in another language entirely, such as MacRuby, Java (with j2objc), or C# (with MonoTouch).

 Xcode includes the Clang compiler, which turns code written in Objective-C, C, and a few other languages into executable code. Most error messages come from Clang, and Xcode relies heavily on it for search indexing, syntax highlighting, and name completion of Objective-C code.

 Cocoa and Cocoa Touch are application frameworks. Each one is a suite of many individual frameworks (libraries stored in folders named blahblah.framework), such as:

 * Foundation (both): General object-oriented utilities, including NSString, NSURL, NSFileManager, etc.
 * Core Foundation (both): Mostly the same thing, but different, mainly in having a C-based API rather than Objective-C
 * Application Kit (Mac): Application and windowing framework
 * UIKit (iOS): Application and windowing framework
 * Core Graphics (both): Drawing
 * Core Animation (both): Sprite-management and animation framework
 (and many, many more where they came from, especially on the Mac)
 
 So:

 i) You can use a framework besides Cocoa or Cocoa Touch, but you'll have to have some Cocoa/Cocoa Touch code, at some level, in order for your application to talk to the system, receive events, draw, etc. Frameworks that specifically target Mac and/or iOS will include the relevant wrappers for you, at varying levels of quality.
 
 ii) You can use a language besides Objective-C, but you'll have lots of syntactic awkwardness, as most of Cocoa and Cocoa Touch are designed for Objective-C's unique syntactic features (particularly selectors).
 
 iii) You can use an editor besides Xcode, and you can even use a build system besides Xcode (such as make), but Apple's App Stores expect apps built a particular way (especially with regard to code signing), so unless you're not targeting the App Stores, any other build system has to replicate what Xcode does or risk its users getting rejections.
 */


// 4- What is the short cut to open the “Code Snippet Library” in Xcode?

/*
 You can access the Code Snippet Library from the Xcode Source Editor by choosing View, Utilities, Show Code Snippet Library, or by pressing Control+Option+Command+2. The library appears in the Utility area and is represented by the { } icon
 
 ------refer to assets------
 1- code snippet,
 2- view contents of code snippet
 
 */


// 5- Mention what are the build phases available in Xcode?

/*
 i) Dependencies
 ii) Compile Sources
 iii) Link Binary with Libraries
 iv) copy Bundle Resources
 */

// 6- Explain how app delegate is declared by Xcode project templates?

/*
 App delegate is declared as a subclass of UIResponder by Xcode project templates. If the UIApplication object does not handle an event, it dispatches the event to your app delegate for processing.
 
 The UIResponder class defines an interface for objects that respond to and handle events.
 */

// 7- Explain how you define variables in Swift language?

/*
 A variable declaration tells the compiler where and how much to create the storage for the variable. Before you use variables, you must declare them using var keyword as follows −

 var variableName = <initial value>
 
 The following example shows how to declare a variable in Swift −
 var varA = 42
 print(varA)
 
 When we run the above program using playground, we get the following result −
 42
 
 */


// 8- What is interface builder?

/*
 The Interface Builder editor within Xcode makes it simple to design a full user interface without writing any code. Simply drag and drop windows, buttons, text fields, and other objects onto the design canvas to create a functioning user interface.

 Because Cocoa and Cocoa Touch are built using the Model-View-Controller pattern, it is easy to independently design your interfaces, separate from their implementations. User interfaces are actually archived Cocoa or Cocoa Touch objects (saved as .nib files), and macOS and iOS will dynamically create the connection between UI and code when the app is run.
 */

// 9- What is the difference between AppDelegate and SceneDelegate?

/*
  AppDelegate is responsible for handling application-level events, like app launch and
 
 the SceneDelegate is responsible for scene lifecycle events like scene creation, destruction and state restoration of a UISceneSession.
 */


// 10- Which function is called when the app launches from a suspended state?

/*
 applicationWillEnterForeground and applicationWillResignActive will be get called!
 */


// 11- Which framework is needed to render UI elements in Playground?
/*
 UIKit frmework
 */

// 13 - List devices and their resolutions, screen size has iOS as their OS.
/*
 
 refer assets - devices and their resolutions, screen size has iOS

 */
