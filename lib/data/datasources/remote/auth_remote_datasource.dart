abstract class AuthRemoteDataSource {
  Future<bool> register(Map<String, dynamic> data);

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  @override
  Future<bool> register(Map<String, dynamic> data) async{
    //Todo fare chiamata HTTP al backend .NET
    //ESEMPIO
    await Future.delayed(const Duration(seconds: 1));
    print("DATI INVIATI AL SERVER:");
    print(data);
    return true;
  }
}