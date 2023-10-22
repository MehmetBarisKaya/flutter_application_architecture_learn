class FriendQuery {
  FriendQuery({this.limit, this.q});
  final int? limit;
  final String? q;
}

enum FriendQueryEnum { LIMIT, Q }

extension FriendQueryEnumString on FriendQueryEnum {
  String get rawValue {
    switch (this) {
      case FriendQueryEnum.LIMIT:
        return 'limit';
      case FriendQueryEnum.Q:
        return 'q';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
