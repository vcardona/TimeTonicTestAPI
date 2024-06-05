# TimeTonic Test API

This project is a demonstration of integrating with the TimeTonic API to perform various actions such as creating an app key, OAuth key, session key, and fetching books. The application is built using Swift and utilizes a clean architecture to separate concerns between the UI, business logic, and network requests.

## Features

- **Login:** Users can log in using their credentials.
- **Activity Indicator:** Displays a loading indicator during the login process.
- **Books List:** Fetches and displays a list of books after a successful login.
- **Clean Architecture:** The project is structured to maintain a clear separation of concerns.

## Project Structure

- `ViewController`: Handles user interaction and UI updates.
- `LoginView`: Custom view for the login screen.
- `BooksViewController`: Displays the list of books.
- `BooksView`: Custom view for displaying books.
- `APIManager`: Manages API calls and network requests.
- `ApiService`: Provides network services for making API requests.
- `Extensions`: Contains extensions for commonly used utilities.

## Getting Started

### Prerequisites

- Xcode 12.0 or later
- Swift 5.0 or later

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/your-username/timetonic-test-api.git
    cd timetonic-test-api
    ```

2. Open the project in Xcode:
    ```sh
    open TimeTonicTestAPI.xcodeproj
    ```

3. Build and run the project in Xcode.

## Usage

1. Enter your username and password on the login screen.
2. Click the "Login" button.
3. The application will display an activity indicator while logging in.
4. Upon successful login, a list of books will be displayed.

## Customization

### API Credentials

Update the `Config.swift` file with your API credentials:
```swift
struct Config {
    static let apiUsername = "your_username"
    static let apiPassword = "your_password"
}
