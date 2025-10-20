# Shopsy - Flutter E-commerce App

## 📱 APK Download

*[Download app-release.apk](./app-release.apk)* - Ready to install on Android devices

---

## Assigned Flutter Task Description
*

Q1:
Please answer the following: 

*How did you approach the task?*

Tried to keep the codebase clean and split things by features so it's easy to manage.

*What packages did you choose and why?*

Used flutter_bloc for state, Hive for saving data, and freezed to avoid boilerplate code.

*What architectural decisions did you make?*

Broke things up into UI, logic (blocs/repos), and storage to keep stuff separate.

*What tradeoffs did you face?*

Picked Hive for speed and easy setup, even though it's more basic, and used code generation for less typing.


Q2:
Which of the following Flutter concepts are you familiar with? (Select all that apply)
*
☑️ State Management (Provider, BLoC, Riverpod, etc.)
☑️ Asynchronous Programming (Future, Async/Await)
☑️ API Integration (HTTP requests, JSON parsing)
☑️ Local Storage (Shared Preferences, SQLite, Hive)
☑️ Firebase Integration (Auth, Firestore, Storage, etc.)
☑️ Animations
☑️ Custom Widgets
☑️ Platform Channels
☑️ Testing (Unit, Widget, Integration)
☑️ Flutter For Web
☑️ Other: Code Generation (Freezed, JSON Serializable), Performance Optimization, Clean Architecture



Q3:
Rate your experience with the following aspects of Flutter development:
*

| Aspect                              | Rating                    |
|-------------------------------------|---------------------------|
| UI Layout and Responsiveness        | Highly experienced        |
| Performance Optimization            | Highly experienced        |
| Debugging                           | Highly experienced        |
| Error Handling                      | Highly experienced        |
| Version Control (Git)               | Highly experienced        |

*Evidence from this project:*
•⁠  ⁠*UI Layout*: Created responsive product cards, cart UI, custom widgets with proper constraints
•⁠  ⁠*Performance*: Implemented in-memory caching, lazy initialization, optimized storage I/O
•⁠  ⁠*Debugging*: Used proper error states in BLoC, handled null cases, type-safe navigation
•⁠  ⁠*Error Handling*: Try-catch blocks in repositories, error states in BLoC pattern
•⁠  ⁠*Git*: Organized commits, feature-based development, clean project structure