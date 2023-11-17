import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/services/navigation_service.dart';
import 'package:login_app/domain/usecases/user_use_case.dart';
import 'package:mobx/mobx.dart' ;
import 'package:login_app/domain/entities/user_entity.dart';

part 'profile_controller.g.dart';


class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  
  final UserUseCase userUseCase;
  final NavigationService navigationService;

  _ProfileControllerBase({required this.userUseCase, required this.navigationService});

  @observable
  bool editLoading = false;

  @observable
  List<ActivitiesEntity> activities = [];

  @observable
  late UserEntity? user;

  @observable
  bool deleteLoading = false;

  @observable
  bool addLoading = false;

  @action 
  Future<void> fetchActivity() async{
    activities= await userUseCase.fetchActivities();
  }

  @action 
  Future<void> logout() async{
    try {
      var result= await userUseCase.logout();
    }finally{
      goToLogin();
    }
  }

  @action 
  Future<void> fetchUser() async{
    try {
      user= await userUseCase.getUser();
    }finally{
      goToLogin();
    }
  }

  void goBack (){
    navigationService.navigateToBack();
  }

  void goToLogin (){
    navigationService.navigateToLogin();
  }
}