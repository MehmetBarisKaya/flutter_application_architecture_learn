import 'dart:io';

enum PlatformProjectEnum { ANDROID, IOS }

extension PlatformProjectEnumExtension on PlatformProjectEnum {
  int get versionNumber => Platform.isAndroid
      ? PlatformProjectEnum.ANDROID.index
      : PlatformProjectEnum.IOS.index;
}
