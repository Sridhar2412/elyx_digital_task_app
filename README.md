# Elyx Digital Task - Clean Architecture Flutter App

A modern, enterprise-grade Flutter application demonstrating Clean Architecture principles, robust state management, and a seamless offline-first experience.

## 🚀 Key Features

- **User Listing**: Fetches and displays a paginated list of users from the GitHub API.
- **Infinite Scrolling**: Automatically loads more users as the user scrolls to the bottom.
- **Intelligent Search**: robust client-side filtering by name, supporting multi-term queries and debouncing.
- **Hero Transitions**: Smooth avatar transitions from listing to detail view.
- **Offline Experience**:
  - **Smart Caching**: Local persistence with automatic 1-hour invalidation.
  - **Graceful Connectivity Handling**: The app never blocks the user. When offline, it displays cached data with a sleek **Offline Bottom Bar** overlay and a "Retry" option.
- **Functional Error Handling**: Uses `Dartz` for functional error management (`Either<AppException, T>`), ensuring type-safety and robust exception handling.

## 🛠 Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev) (using modern `@riverpod` annotations and Notifiers).
- **Architecture**: **Clean Architecture** (separate Presentation, Domain, and Data layers) for maximum scalability and testability.
- **Networking**: [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit).
- **Navigation**: [AutoRoute](https://pub.dev/packages/auto_route) for strongly-typed declarative routing.
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it).
- **Styling**: Vanilla CSS-like approach using custom **Widget Extensions** for consistent padding and margins.

## 📁 Project Structure

```text
lib/
├── core/             # DI setup, AppException, theme, and widget extensions.
├── data/             # DTOs, Repository Implementation, Data Sources (Remote/Local).
├── domain/           # Entities (Freezed) and Repository Interfaces.
└── presentation/     # UI Pages, Notifiers (State management), and Components.
```

## ⚙️ Getting Started

1.  **Project Initialization**:
    ```bash
    flutter pub get
    ```
2.  **Code Generation** (Models, Routes, API):
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
3.  **Run Application**:
    ```bash
    flutter run
    ```

## 🧪 Documentation & Testing

- **Architecture Audit**: The project strictly follows a "Feature-First" inside Presentation and "Layer-First" across the app boundary.
- **Unit Testing**: Core logic is verified via a comprehensive suite of mock tests.
  ```bash
  flutter test
  ```

---
*Developed as part of the Flutter Developer Assessment.*
