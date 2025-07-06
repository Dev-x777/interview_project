# 🕊️ WingsFly – Flutter Interview Project

WingsFly is a beautiful and minimal productivity app built with **Flutter**. This project was created as part of an interview assignment, showcasing UI design, clean architecture, dynamic state management, and responsive layout principles.

---

## 📱 Features

- 📅 **Horizontal Date Picker** – scrollable timeline with weekday and date display  
- ✅ **Task List UI** – sleek and interactive cards with tags, time, icons, and status toggles  
- 📊 **Daily Progress Tracker** – live progress bar with percentage completion  
- 🧘‍♀️ **Daily Motivational Quote** – auto-updated quote of the day  
- ➕ **Custom Modal Bottom Sheet** – elegant drawer with 4 activity types: Habit, Recurring Task, Task, Goal of the Day  
- 🌓 **Light & Dark Theme Support** – adapts to device's theme automatically  
- 📱 **Fully Responsive** – adapts beautifully across all screen sizes using `MediaQuery`

---

## 💻 Tech Stack

| Tool           | Description                     |
|----------------|---------------------------------|
| Flutter        | Cross-platform UI toolkit       |
| Dart           | Programming language            |
| Material Design| UI/UX framework for Flutter     |
| Android Studio | IDE used for development        |

---

## 🧩 Folder Structure

lib/
├── models/
│ └── task_model.dart # Data model for tasks
├── screens/
│ └── home_screen.dart # Main screen with quote, progress, and task list
├── widgets/
│ ├── date_selector.dart # Scrollable weekday selector
│ ├── task_item.dart # Task UI card
│ └── bottom_drawer.dart # Bottom modal drawer with task options
└── main.dart # App entry point with light & dark theme setup



---

## ⚙️ Setup Instructions

1. **Clone the Repository**


git clone https://github.com/Dev-x777/wingsFly.git
cd wingsFly
flutter pub get
flutter run

##🔑 Key Decisions & Highlights
🌓 In-built Dark Mode Support – Theme switches automatically based on system preference using ThemeMode.system.

📱 Responsive Design – Layout scales and adapts perfectly across small to large devices using MediaQuery, Flexible, and Expanded.

🔁 Clean Widget Structure – Reusable, stateless components used where applicable for maintainability.

📆 Date Scroll Experience – Scrollable date picker with animated auto-scroll to the selected day.

📋 Hardcoded Tasks for Demo – Tasks are static for the assignment but architecture supports future backend/data integration.

💬 Quote of the Day – Dynamically changes each day based on current date logic.
