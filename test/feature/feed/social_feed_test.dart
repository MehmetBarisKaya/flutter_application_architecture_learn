import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/user_friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/viewmodel/social_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:vexana/vexana.dart';
import 'social_network_mock.dart';

class SocialBuildContext extends Mock implements BuildContext {}

class SocialMockViewModel extends Mock implements SocialViewModel {
  SocialMockViewModel(SocialNetworkMock mockService);
}

class SocialFakeViewModel extends Fake implements SocialViewModel {
  SocialFakeViewModel(SocialNetworkMock mockService);

  @override
  bool isLoading = false;
  @override
  List<SocialUser>? socialUserList = [];

  @override
  Future<void> fetchAllUserLoading(int index) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    socialUserList = [SocialUser(id: 1)];
    isLoading = false;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

void main() {
  late BuildContext context;
  late SocialNetworkMock mockService;
  late INetworkManager networkManager;
  late SocialViewModel socialMockViewModel;
  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager<Null>(options: BaseOptions());
    mockService = SocialNetworkMock(networkManager, null);
    socialMockViewModel = SocialMockViewModel(mockService);
    socialMockViewModel.setContext(context);
  });
  test('Set Context Test', () async {
    verify(socialMockViewModel.setContext(context));
  });
  test('List Check Test', () async {
    await socialMockViewModel.fetchAllUserLoading(1);
    when(await socialMockViewModel.fetchAllUserLoading(0))
        .thenReturn(Future.value(""));
    expect(socialMockViewModel.socialUserList?.length, 1);
  });
  test('Loading Test 2 ', () async {
    socialMockViewModel.fetchAllUserLoading(1);
    expect(socialMockViewModel.isLoading, true);
    await Future.delayed(Duration(seconds: 1));
    expect(socialMockViewModel.isLoading, false);
  });

  test('User All Loading', () async {
    socialMockViewModel.isLoadingLazy = false;
    socialMockViewModel.socialUserList = [];
    socialMockViewModel.isLazyLoadDataFinished = false;

    await socialMockViewModel.fetchAllUserLoading(-1);
    expect(socialMockViewModel.socialUserList?.isNotEmpty, true);
    expect(socialMockViewModel.page > 0, true);
    expect(socialMockViewModel.isLoading, false);
  });
  test('Loading Test', () async {
    await socialMockViewModel.fetchAllUserLoading(0);
    verifyNever(socialMockViewModel.isLoading);
  });
  test('Fetch User id', () async {
    final response = await mockService.fetchUser(1);
    expect(response, isNotNull);
  });
  test('Fetch House List', () async {
    final response = await mockService.fetchUserHouseList(FriendQuery());
    expect(response, isNotNull);
  });
  test('Fetch User Name', () async {
    final response = await mockService.fetchUserNameQuery("hello");
    expect(response, isNotNull);
  });
}
