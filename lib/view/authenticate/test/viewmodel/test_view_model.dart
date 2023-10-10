import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/app_theme_enum.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}

  @observable
  int number = 0;

  @observable
  bool isLoading = false;

  @computed
  bool get isEven => number.isEven;

  @action
  void increment() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(viewModelContext, listen: false)
        .changeTheme(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    // final response = await coreDio!.fetchData<List<TestModel>, TestModel>('x',
    //     type: HttpRequestTypes.GET, parseModel: TestModel());
    // // ignore: unnecessary_type_check
    // if (response is List<TestModel>) {
    //   //print true
    // } else {
    //   // response.error;
    // }
    isLoading = false;
  }
}
