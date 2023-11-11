import 'package:mobx/mobx.dart' ;

part 'login_controller.g.dart';


class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  @observable
  String username= "";

  @observable
  bool visiblePassword= false;


  @observable
  String password= "";

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


  bool validatePassword(String input) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9]{2,20}(?<!\s)$");
    return regex.hasMatch(input);
  }

  bool validateUsername(String input) {
    RegExp regex = RegExp(r"^(?!.*\s$).{1,20}$");
    return regex.hasMatch(input);
  }

  
}