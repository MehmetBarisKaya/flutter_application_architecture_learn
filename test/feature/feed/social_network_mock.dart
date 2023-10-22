import 'package:fluttermvvmtemplate/view/_product/_model/query/user_friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';

class SocialNetworkMock extends SocialService {
  SocialNetworkMock(super.manager, super.scaffoldyKey);
}

class SocialNetworkMockAll extends ISocialService {
  SocialNetworkMockAll(super.manager, super.scaffoldyKey);

  @override
  Future<SocialUser?> fetchUser(id) async {
    await Future.delayed(Duration(seconds: 1));
    return SocialUser(id: id);
  }

  @override
  Future<List<SocialUser>?> fetchUserHouseList(FriendQuery friendQuery) {
    // TODO: implement fetchUserHouseList
    throw UnimplementedError();
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
