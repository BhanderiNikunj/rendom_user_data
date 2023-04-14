import 'package:flutter/material.dart';
import 'package:rendom_user_data/ApiHelper/ApiHelper.dart';
import 'package:rendom_user_data/Screen/Home/Model/RandomUserModel.dart';

class RandomUserProvider extends ChangeNotifier{
    RandomUserModel? randomUserModel;

    Future<RandomUserModel> ApiCall() async {
      ApiHelper apiHelper = ApiHelper();
      RandomUserModel r1 = await apiHelper.RandomApiCall();
      return r1;
    }
}