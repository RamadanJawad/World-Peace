import 'package:get/get.dart';
import 'package:world_peace/core/api/api_follow.dart';

class NotificationController extends GetxController{

  void acceptFollow(var userId)async{
    bool? response=await ApiFollowController().acceptFollow(userId);
    if(response){
      print(true);
      update();
    }
  }

  void rejectFollow(var userId)async{
    bool? response=await ApiFollowController().rejectFollow(userId);
    if(response){
      update();
    }
  }
}