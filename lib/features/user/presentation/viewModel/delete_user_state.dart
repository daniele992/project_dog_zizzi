enum DeleteStatus {
  initial,
  loading,
  success,
  forbidden,
  unauthorized,
  error,
}

class DeleteUserState {
  final DeleteStatus status;
  final String? message;

  const DeleteUserState({
    this.status = DeleteStatus.initial,
    this.message,
  });

  /*copyWith crea una nuova istanza dell'oggetto copiando i valori esistenti e modificando solo quelli che vogliamo cambiare
  servono perchè gli stati sono immutabili: invece di modificarli, ne creiamo uno nuovo con le modifichye
  * */
  DeleteUserState copyWith({
    DeleteStatus? status,
    String? message,
  }) {
    return DeleteUserState(
        status: status ?? this.status,
        message: message
    );
  }
}
