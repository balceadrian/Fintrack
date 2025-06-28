# FinTrack - Personal Finance Management App

A Flutter-based mobile application for tracking personal finances, budgeting, and expense management.

## 🚀 Features

- **User Authentication**: Sign up and sign in functionality
- **Onboarding Flow**: Guided setup for new users
- **Dashboard**: Overview of financial status
- **Expense Tracking**: Log and categorize expenses
- **Budget Management**: Set and monitor budgets
- **Reports**: Visual insights into spending patterns

## 📱 Screenshots

*Add screenshots of your app here*

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Database**: MySQL (via REST API)
- **State Management**: Flutter StatefulWidget
- **UI Framework**: Material Design

## 📋 Prerequisites

Before running this project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/fintrack.git
cd fintrack
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Backend (Optional)

If you want to use the database functionality:

1. Set up your MySQL backend server
2. Update the `baseUrl` in `lib/services/user_service.dart`
3. Ensure your backend API endpoints match the service methods

### 4. Run the App

```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── dashboard.dart
│   ├── sign_in.dart
│   ├── sign_up.dart
│   ├── onboarding.dart
│   └── ...
├── services/                 # API services
│   └── user_service.dart
├── widgets/                  # Reusable widgets
│   ├── custom_button.dart
│   └── button_painter.dart
└── database/                 # Database helpers (if using local storage)
    └── database_helper.dart
```

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
API_BASE_URL=http://your-backend-url.com/api
```

### Database Configuration

Update the `UserService` class in `lib/services/user_service.dart`:

```dart
static const String baseUrl = 'http://your-backend-url.com/api';
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

### 1. Fork the Repository

Click the "Fork" button on the GitHub repository page.

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

### 3. Make Your Changes

- Follow the existing code style
- Add comments for complex logic
- Update documentation if needed

### 4. Test Your Changes

```bash
flutter test
flutter analyze
```

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat: add your feature description"
```

### 6. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## 📝 Code Style

- Use meaningful variable and function names
- Follow Dart/Flutter conventions
- Add comments for complex logic
- Keep functions small and focused
- Use proper indentation (2 spaces)

## 🐛 Bug Reports

If you find a bug, please create an issue with:

1. **Title**: Clear description of the bug
2. **Description**: Detailed explanation
3. **Steps to Reproduce**: Step-by-step guide
4. **Expected vs Actual Behavior**
5. **Screenshots** (if applicable)
6. **Device/OS Information**

## 💡 Feature Requests

For new features:

1. Check existing issues first
2. Create a new issue with the "Feature Request" label
3. Describe the feature and its benefits
4. Provide mockups or examples if possible

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Your Name** - Lead Developer
- **Collaborator 1** - UI/UX Designer
- **Collaborator 2** - Backend Developer

## 📞 Contact

- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)
- **LinkedIn**: [Your Name](https://linkedin.com/in/yourprofile)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI components
- All contributors and testers

---

**Happy Coding! 🎉**
