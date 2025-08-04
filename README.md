# 🍽️ Appetizers App (SwiftUI)

A SwiftUI-based Appetizer ordering app. This project mimics a small food-ordering interface where users can browse appetizers, view details, and manage their order.

## 📸 Screenshots
<table>
  <tr>
    <td><img src="https://github.com/581-pooja/Appetizers/blob/main/Appetizers_Images/MenuPage.jpeg?raw=true" width="200" height="400"/></td>
    <td><img src="https://github.com/581-pooja/Appetizers/blob/main/Appetizers_Images/detailPage.jpeg?raw=true" width="200" height="400"/></td>
    <td><img src="https://github.com/581-pooja/Appetizers/blob/main/Appetizers_Images/CartPage.jpeg?raw=true" width="200" height="400"/></td>
    <td><img src="https://github.com/581-pooja/Appetizers/blob/main/Appetizers_Images/AccountPage.jpeg?raw=true" width="200" height="400"/></td>
  </tr>
</table>

## 📂 Features
- Browse Appetizers List.
- View Appetizer Details with nutrition information.
- Add items to Order.
- Manage Order (Add/Remove items).
- Persist user profile (Account Tab).
- Smooth UI interactions with loading, empty states, and error alerts.

## 🛠️ Tech Stack
- SwiftUI — Declarative UI Framework for building iOS Apps
- MVVM Architecture — Model-View-ViewModel design pattern
- Combine / @StateObject, @ObservedObject, @EnvironmentObject — SwiftUI State Management
- UserDefaults (@AppStorage) — Lightweight data persistence
- AsyncImage — Asynchronous Image Loading
- Networking Layer (Mock API calls) — Simulated network requests
- Xcode Previews — Live SwiftUI Component Previews

## 📚 Concepts & Skills Learned

### 🖥️ SwiftUI Core Concepts
- View Modifiers & Layouts: VStack, HStack, ZStack, TabView, NavigationStack.=
- State Management:
  - @StateObject for managing ViewModels.
  - @ObservedObject and @EnvironmentObject for shared data (Order context).
  - @AppStorage for persisting user data in UserDefaults.

### 🔄 MVVM Architecture
- ViewModels for handling data/business logic: AppetizerListViewModel, AccountViewModel.
- Views only manage UI; data fetching & validation are handled in ViewModels.
- Clean separation of concerns using MVVM.

### 🌐 Networking & Async Handling
- API integration simulation using NetworkManager.
- Loading indicators with isLoading state.
- SwiftUI Alerts for network error handling.

### 📦 Data Persistence
- Used @AppStorage & UserDefaults for saving user profile data.
- @AppStorage auto-syncs UserDefaults data with SwiftUI views.

### 🎨 UI Features & Animations
- AsyncImage for image loading with placeholders.
- Dynamic blur effect when showing Appetizer details modal.
- Tab badge count dynamically updating with Order items.
- Conditional UI rendering for empty states & overlays.

### 📋 SwiftUI Best Practices
- MVVM separation maintained cleanly.
- Reusable UI Modifiers (like standardButtonStyle()).
- Lifecycle events handled with .onAppear.
- Contextual data passing using @EnvironmentObject safely.

