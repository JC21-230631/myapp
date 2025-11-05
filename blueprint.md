
# Calendar & Health App Blueprint

## Overview

This application is a comprehensive calendar and health management tool designed to help users organize their schedules, track their health, and manage their tasks efficiently. It integrates with native calendar and health functionalities, and provides a seamless user experience with a modern and intuitive interface.

## Architecture

*   **State Management:** Provider with ChangeNotifier for managing app-wide state. This includes:
    *   `CalendarState`: Manages calendar events, selections, and device calendar interactions.
    *   `ThemeProvider`: Manages the application's light and dark themes.
    *   `HealthState`: Manages health data, including steps, sleep, goals, and weekly reports.
*   **Routing:** A mix of `go_router` for primary navigation and `MaterialPageRoute` for secondary screens.
*   **Theming:** Centralized theme management with support for both light and dark modes, using google_fonts for improved typography.
*   **Error Handling:** Utilizes `dart:developer` for structured logging of errors, particularly in asynchronous operations and permission handling.

## Features

### 1. Calendar

*   **Monthly Calendar View:** A clear and easy-to-navigate monthly calendar.
*   **Event Integration:** Fetches and displays events from the user's native device calendar.
*   **Date Selection:** Users can select a date to view events.

### 2. Reminders & Tasks

*   **Task List:** A dedicated screen to manage tasks and reminders.

### 3. Health Tracking

*   **Pedometer:** Tracks the user's steps in real-time and displays the daily count.
*   **Sleep Tracking:** Fetches and displays sleep data from the native health API.
*   **Goal Setting:** Users can set a daily step goal.
*   **Weekly Reports:** Visualizes weekly step and sleep data in bar charts.

### 4. User Authentication

*   **Member Registration:** Users can create an account using their email and password.
*   **Firebase Integration:** Utilizes Firebase Authentication for secure user management.

### 5. Memo

*   **Daily Memos:** Users can add and save memos for any selected date on the calendar.

### 6. Game

*   **Game Screen:** A dedicated screen for games.
*   **Friend Screen:** A sub-screen accessible from the Game screen with the following features:
    *   **Friend Icons:** Each friend has a unique icon for easy identification.
    *   **Add Friend:** Users can add new friends to their list.
    *   **View Profile:** Users can tap on a friend to view their profile.

## Style and Design

*   **Modern UI:** A clean and modern user interface with a simple and intuitive layout.
*   **Bottom Navigation:** Easy access to all main features through a bottom navigation bar. The order of the items is: Calendar, Health, Add, Game, Account.
*   **Visual Feedback:** Clear visual cues for selected dates, events, and progress tracking.
*   **Typography:** Enhanced readability and a modern feel with the google_fonts package.

## Current Implementation Plan

*   **New Feature: Friend Management**
    *   **Friend Icons:** Added icons to friends for better visual representation.
    *   Implemented a friend list on the `FriendScreen`.
    *   Added functionality to add new friends.
    *   Created a `ProfileScreen` to display friend profiles.
    *   Linked the friend list to the `ProfileScreen`.
*   **New Feature: Friends in Game Screen**
    *   **UI Improvement:** Moved the "フレンド" (Friend) button to the top-right corner of the `GameScreen` for a cleaner layout.
    *   Created a new `FriendScreen` that is navigated to when the button is pressed.
*   **UI Refinements:**
    *   **Bottom Navigation:**
        *   Renamed "その他" to "アカウント" and updated the icon.
        *   Added a "ゲーム" tab with a corresponding `GameScreen`.
        *   Reordered the tabs to be: "カレンダー", "ヘルスケア", "追加", "ゲーム", "アカウント".
*   **Code Refactoring:**
    *   Replaced `MoreScreen` with `AccountScreen` and updated all relevant references.
    *   Created `GameScreen` and integrated it into the main navigation.
*   **Finalization:**
    *   Update `blueprint.md` to reflect the latest UI and feature changes.
