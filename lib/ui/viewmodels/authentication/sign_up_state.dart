class SignUpState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const SignUpState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  // Comodità per copiare lo stato modificando solo alcuni campi
  SignUpState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}

