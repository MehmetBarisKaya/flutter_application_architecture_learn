import 'package:fluttermvvmtemplate/view/_product/_model/query/user_friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/service_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:vexana/vexana.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(super.manager, super.scaffoldyKey);

  @override
  Future<SocialUser?> fetchUser(id) async {
    final respose = await manager.send<SocialUser, SocialUser>(
        NetworkRoutes.POSTS.rawValue,
        parseModel: SocialUser(),
        method: RequestType.GET,
        urlSuffix: "/$id");
    showMessage(scaffoldyKey, respose.error);

    return respose.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery friendQuery) async {
    final respose = await manager.send<SocialUser, List<SocialUser>>(
      NetworkRoutes.POSTS.rawValue,
      parseModel: SocialUser(),
      method: RequestType.GET,
      // queryParameters: {
      //   FriendQueryEnum.LIMIT.rawValue: friendQuery.limit,
      //   FriendQueryEnum.Q.rawValue: friendQuery.q,
      // },
    );

    showMessage(scaffoldyKey, respose.error);
    return respose.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
