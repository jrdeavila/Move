abstract interface class IChatService {
  Future<void> sendMessage({
    required String message,
    required String numberPhone,
  });
}
