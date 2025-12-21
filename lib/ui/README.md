# Contains everything the user sees → Views + ViewModels

VIEW = screen (UI only)

VIEWMODEL = logic, state, functions for the view
This is the core of MVVM in Flutter.

Each screen has:
home/
├── home_view.dart
├── home_viewmodel.dart
└── widgets/

# PASSAGGI REGISTRAZIONE
FLUTTER
SignUpPage
↓
SignUpViewModel
↓ HTTP POST
API .NET
Controller
↓
UseCase / Service
↓
Repository
↓
Entity Framework Core
↓
SQL Server (SSMS)

