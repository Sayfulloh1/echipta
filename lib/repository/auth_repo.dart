class AuthRepository{

  final Dio dio;
  final NetworkInfo networkInfo;

  AuthRepository(this.dio);

  Future<Either<Failure,String>> sendOtp()async{
    if(await networkInfo){

    }



  }
}