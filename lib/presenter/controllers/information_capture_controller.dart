

import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/services/navigation_service.dart';
import 'package:login_app/domain/usecases/user_use_case.dart';
import 'package:mobx/mobx.dart' ;

part 'information_capture_controller.g.dart';


class InformationCaptureController = _InformationCaptureControllerBase with _$InformationCaptureController;

abstract class _InformationCaptureControllerBase with Store {
  
  final UserUseCase userUseCase;
  final NavigationService navigationService;

  _InformationCaptureControllerBase({required this.userUseCase, required this.navigationService}){
    fetchActivity();
  }


  @observable
  bool editLoading = false;

  @observable
  List<ActivitiesEntity> activities = [];

  @observable
  bool deleteLoading = false;


  @action
  void setLoadingEdit(bool value){
    editLoading= value;
  }

  @action
  void setLoadingDelete(bool value) {
    deleteLoading = value;
  }

  @action 
  Future<bool> deleteActivity(int id) async{
    setLoadingDelete(true);
    var result= await userUseCase.deleteActivity(id);
    if(result)
     setLoadingDelete(false);
    return result;
  }

  @action 
  Future<void> fetchActivity() async{
    activities= await userUseCase.fetchActivities();
  }

  @action 
  Future<bool> editActivity(ActivitiesEntity activity) async{
    setLoadingEdit(true);
    var result= await userUseCase.editActivity(activity);
    if(result)
    setLoadingEdit(false);
    return result;
  }

  void goBack (){
    navigationService.navigateToBack();
  }
}