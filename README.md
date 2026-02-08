# Hasalty - Family Financial Management Platform

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.3%2B-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3%2B-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-brightgreen.svg)](#supported-platforms)

A comprehensive multi-platform financial management application designed to empower families with tools for spending tracking, allowance management, and financial analytics.

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Key Features](#-key-features)
- [Supported Platforms](#-supported-platforms)
- [Architecture](#-architecture)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Dependencies](#-dependencies)
- [Development](#-development)
- [Building](#-building)
- [Contributing](#-contributing)
- [Security & Authentication](#-security--authentication)
- [License](#-license)

---

## 🎯 Overview

**Hasalty** is a sophisticated family financial management platform built with Flutter. It provides parents and children with an integrated solution to manage allowances, track spending, set financial goals, and gain insights into family spending patterns through advanced analytics.

The platform supports dual-user roles (parents and children) with distinct permissions and features, enabling families to teach financial literacy while maintaining parental oversight.

### **Use Cases**
- Parents can allocate allowances and monitor their children's spending
- Children can track personal spending and set financial goals
- Families can view spending analytics and trends
- Card management and freeze capabilities for security
- Real-time spending notifications and alerts

---

## ✨ Key Features

### **User Authentication & Account Management**
- Secure login system with role-based access (Parent/Child)
- Account creation with password validation
- Username validation (parent/child prefix requirement)
- Session management

### **Dashboard & Analytics**
- Home screen with card balance display
- Weekly, monthly, and yearly spending analytics
- Interactive donut charts for spending breakdown
- Real-time spending insights and AI-powered recommendations
- Savings goals tracking

### **Card Management**
- Virtual card status display
- Card freeze functionality for security
- Balance management and top-up capabilities
- Card history and transactions

### **Financial Tracking**
- Real-time spending activity monitoring
- Transaction categorization (Gaming, Food & Drink, Travel, etc.)
- Weekly spending comparison and trends
- Spending category limits and alerts
- Goal progress visualization

### **Multi-Platform Support**
- iOS, Android, Web, Windows, macOS, and Linux
- Responsive design for all screen sizes
- Native platform integration

---

## 🖥️ Supported Platforms

| Platform | Status | Min Version |
|----------|--------|------------|
| **iOS** | ✅ Supported | iOS 11.0+ |
| **Android** | ✅ Supported | Android 5.0+ |
| **Web** | ✅ Supported | Modern browsers |
| **Windows** | ✅ Supported | Windows 10+ |
| **macOS** | ✅ Supported | macOS 10.13+ |
| **Linux** | ✅ Supported | Ubuntu 18.04+ |

---

## 🏗️ Architecture

Hasalty follows a **stateful widget-based architecture** with the following design patterns:

### **Layer Structure**
- **Presentation Layer** - Flutter UI components and screens
- **State Management** - StatefulWidget with setState pattern
- **Data Layer** - Local state management (future backend integration)

### **Screen Components**
1. **LoginPage** - Authentication entry point
2. **SignupScreen** - New user registration
3. **HomeScreen** - Dashboard with balance and activity
4. **AnalyticsScreen** - Spending insights and analytics
5. **CardsScreen** - Card management interface
6. **TaskScreen** - Financial tasks and goals

### **Key Design Principles**
- Clean separation of concerns
- Reusable widget components
- Responsive UI with theme support
- Dark mode support throughout the app
- Material Design 3 compliance

---

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK 3.3.0 or higher
- Dart 3.3.0 or higher
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/MohamedAbdelhamid0/hasalty-family-finance.git
   cd hasalty
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For development on connected device
   flutter run
   
   # For specific platform
   flutter run -d macos    # macOS
   flutter run -d windows  # Windows
   flutter run -d linux    # Linux
   flutter run -d chrome   # Web
   ```

### **First Time Setup**

1. Ensure Flutter is properly installed:
   ```bash
   flutter doctor
   ```

2. Accept the Android and iOS licenses:
   ```bash
   flutter doctor --android-licenses
   ```

3. Get packages:
   ```bash
   flutter pub get
   flutter pub upgrade  # (optional) for latest dependencies
   ```

---

## 📁 Project Structure

```
hasalty/
├── lib/
│   └── main.dart                 # Main application entry point
│                                 # Contains all screens and components:
│                                 # - LoginPage
│                                 # - SignupScreen
│                                 # - HomeScreen
│                                 # - AnalyticsScreen
│                                 # - CardsScreen
│                                 # - TaskScreen (referenced)
│
├── assets/                       # Static assets
│   ├── child.avif               # App assets
│   ├── logo.jpeg                # Logo image
│   └── book.jpg                 # App imagery
│
├── android/                      # Android build configuration
├── ios/                         # iOS build configuration
├── web/                         # Web platform configuration
├── windows/                     # Windows desktop configuration
├── macos/                       # macOS configuration
├── linux/                       # Linux desktop configuration
│
├── test/
│   └── widget_test.dart         # Widget tests
│
├── pubspec.yaml                 # Package configuration
├── pubspec.lock                 # Dependency lock file
├── analysis_options.yaml        # Dart analysis rules
└── README.md                    # Project documentation
```

---

## 📦 Dependencies

### **Production Dependencies**
| Package | Version | Purpose |
|---------|---------|---------|
| **flutter** | SDK | Core Flutter framework |
| **cupertino_icons** | ^1.0.8 | iOS-style icons |
| **fl_chart** | ^0.66.0 | Financial charts and analytics |

### **Development Dependencies**
| Package | Version | Purpose |
|---------|---------|---------|
| **flutter_test** | SDK | Testing framework |
| **flutter_lints** | ^5.0.0 | Dart linting rules |

---

## 💻 Development

### **Code Style & Standards**
- Follow Dart style guide
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and modular
- Lint analysis with `flutter analyze`

### **Running Code Analysis**
```bash
# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Run specific test file
flutter test test/widget_test.dart
```

### **Development Tips**
- Use `flutter run -v` for verbose output during debugging
- Use DevTools for performance profiling: `flutter pub global run devtools`
- Hot reload available with `r` during `flutter run`
- Hot restart with `R` for full app restart

---

## 🔨 Building

### **Building for Production**

**Android**
```bash
flutter build apk --split-per-abi              # APK files
flutter build appbundle                        # Google Play Bundle
```

**iOS**
```bash
flutter build ios --release                    # For iOS devices
flutter build ios --release --obfuscate       # Obfuscated build
```

**Web**
```bash
flutter build web --release --csp
flutter build web --web-renderer html         # HTML renderer
flutter build web --web-renderer canvaskit    # Canvas renderer
```

**Windows**
```bash
flutter build windows --release
```

**macOS**
```bash
flutter build macos --release
```

**Linux**
```bash
flutter build linux --release
```

---

## 🤝 Contributing

This is a professional project. For contributions:

1. Create a feature branch from `develop`
2. Ensure all code passes linting: `flutter analyze`
3. Write clear commit messages
4. Create a Pull Request with description

---

## 🔐 Security & Authentication

### **Current Implementation**
- Client-side validation of credentials
- Password requirements: minimum 8 characters, starts with capital letter
- Username validation: must start with "parent" or "child"

### **Future Enhancements**
- Backend API integration with secure authentication
- JWT token implementation
- Biometric authentication (fingerprint/face recognition)
- Two-factor authentication

---

## 📱 Screenshots & Demo
![6fc9ecc0-6682-4525-8589-471e18234033](https://github.com/user-attachments/assets/21763a03-3814-413c-9b88-cd789185f64a)
![51194e2e-c1d0-4522-a8f8-e4f1c437fdf1](https://github.com/user-attachments/assets/638e1616-a915-4a34-862b-5d940a896aa8)
![cf5f329c-6115-4386-99dd-58d25334a340](https://github.com/user-attachments/assets/19854f02-ff24-4882-8960-fa674fe1f091)
![6404a0cb-5fc3-48d2-b78e-ca2976056ba3](https://github.com/user-attachments/assets/65309b09-f87b-4df3-940b-eb380ca25c56)
<img width="1910" height="1010" alt="image" src="https://github.com/user-attachments/assets/b232e3a4-7493-4000-8385-1d4365ac3e60" />
<img width="1922" height="993" alt="image" src="https://github.com/user-attachments/assets/041412d3-dbf9-424f-8359-258a2ae81104" />
<img width="1901" height="999" alt="image" src="https://github.com/user-attachments/assets/f38546ab-0772-43b6-bdf3-0f7f8f7aca64" />


## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to use, modify, and distribute this software under the terms of the MIT License.

---

## 👥 Contact & Support

For questions or support regarding this project, please contact the development team at [mohameddabdelhamid@gmail.com](mailto:mohameddabdelhamid@gmail.com)

---

## 🎓 Educational Value

Hasalty is designed to teach financial literacy through a practical, hands-on approach. It demonstrates:
- Real-time financial tracking
- Data visualization for financial insights
- Goal-setting and progress tracking
- Spending categorization and analysis

---

## 📊 Project Metrics

- **Total Lines of Code**: ~1,747 lines (main.dart)
- **Supported Platforms**: 6 (iOS, Android, Web, Windows, macOS, Linux)
- **Key Features**: 15+ major features
- **Code Quality**: Analyzed with Flutter lints

---

## 🔄 Version History

| Version | Date | Status |
|---------|------|--------|
| 1.0.0 | 2026-02-09 | Beta Release |

---

<div align="center">

© 2026 Hasalty Development Team. All Rights Reserved.

</div>
