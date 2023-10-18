import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/user_friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/thorottle_helper.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:mobx/mobx.dart';
part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  late final ISocialService _socialService;

  bool isLazyLoadDataFinished = false;
  String _query = "";
  late ThrottleHelper _throttleHelper;
  int _page = 0;
  int get page => _page;
  @observable
  List<SocialUser>? socialUserList = [];
  @observable
  bool isLoading = false;
  @observable
  bool isLoadingLazy = false;
  _SocialViewModelBase(this._socialService);
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    _throttleHelper = ThrottleHelper();
    _fetchAllUser();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingLazy() {
    isLoadingLazy = !isLoadingLazy;
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery());

    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isLoadingLazy ||
        index != socialUserList!.length - 1 ||
        isLazyLoadDataFinished) return;

    _changeLoading();

    final response = await _socialService
        .fetchUserHouseList(FriendQuery(limit: _page + 1, q: _query));
    if (response!.isNotEmpty) {
      if (socialUserList!.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList!.last) {
        socialUserList?.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadDataFinished = true;
    }
    _changeLoading();
  }

  void fetchAllSearchQuery(String text) {
    _throttleHelper.onDelaytouch(text, (text) {
      if (_query.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLazyLoadDataFinished = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList!.length - 1);
    });
  }
}
