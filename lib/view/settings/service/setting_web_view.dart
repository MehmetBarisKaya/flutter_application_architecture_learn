class SettingsWebModel {
  final String? url;
  final String title;

  SettingsWebModel(this.title, {this.url});

  factory SettingsWebModel.fakeArchitecturePR() {
    return SettingsWebModel("Project Contributers",
        url: "https://github.com/VB10/flutter-architecture-template/pulls");
  }
  factory SettingsWebModel.fakeNull() {
    return SettingsWebModel("Project Contributers");
  }
}
