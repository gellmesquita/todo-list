import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/application/usecases/user_use_case_imp.dart';
import 'package:login_app/domain/services/navigation_service.dart';
import 'package:login_app/domain/usecases/user_use_case.dart';
import 'package:mobx/mobx.dart' ;




part 'login_controller.g.dart';


class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final UserUseCase userUseCase;
  final NavigationService navigationService;

  _LoginControllerBase({required this.userUseCase, required this.navigationService});  

  @observable
  String username= "";

  @observable
  bool isLoading= false;

  @observable
  bool visiblePassword= false;


  @observable
  String password= "";

  @observable
  String erroAuth= "";


  @observable
  String errorUsername= "";

  @observable
  String errorPassword= "";

  @observable
  bool validData= false;

  @action
  void onChangeUsername(String text) {
    username= text;
    errorUsername="";
  }
  
  @action
  void setVisiblePassword() {
    visiblePassword= !visiblePassword;
  }

  @action
  void setLoading() {
    isLoading= !isLoading;
  }

  @action
  void setErrorAuth(String message) {
    erroAuth= message;
  }

  @action
  void onChangePassword(String text) {
    password= text;
    errorPassword="";
  }

  @action
  bool validateData(){
    var success= true;
    if(!validatePassword(password)){
      success = false;
      errorPassword = "Senha deve conter entre de 2 a 20 caracteres, sem caracteres especias e sem espaço em branco no final.";
    }
    if(!validateUsername(username)){
      success = false;
      errorUsername = "Nome do usuario não pode ser vazio ou conter espaço em branco no final.";
    }
    return success;
  }

  @action
  Future<bool> login()async{
    try {
      setLoading();
      if(validateData()){
        var result = await userUseCase.login(name: username, password: password);
        if(result != null) {
          navigateToActivity();
        } else {
          setErrorAuth("Usuário não encontrado");
          return false;
        }
        return true;
      }else {
        setErrorAuth("Erro ao fazer o login");
        return false;
      }
    } catch (e) {
      setErrorAuth("$e");
      return false;
    }finally{
      setLoading();
    }
  }

  void navigateToActivity (){
    navigationService.navigateToActivies();
  }

  bool validatePassword(String input) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9]{2,20}(?<!\s)$");
    return regex.hasMatch(input);
  }

  bool validateUsername(String input) {
    RegExp regex = RegExp(r"^(?!.*\s$).{1,20}$");
    return regex.hasMatch(input);
  }

  
}