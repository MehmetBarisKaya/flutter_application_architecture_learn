import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/animation/socail_card_animation.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/listtile/friend_card.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:fluttermvvmtemplate/view/home/social/viewmodel/social_view_model.dart';
import 'package:kartal/kartal.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(
          SocialService(VexanaManager.instance.networkManager, scaffoldKey)),
      //onsur
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, _viewModel) => Container(
        padding: context.padding.low,
        color: context.general.colorScheme.background,
        child: Scaffold(
            appBar: buildAppBar(context),
            body: Column(
              children: [
                Text(
                  LocaleKeys.home_social_findFriends.locale,
                  style: context.general.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.general.colorScheme.onSecondary),
                ),
                TextField(
                  onChanged: (value) {
                    _viewModel.fetchAllSearchQuery(value);
                  },
                  decoration: InputDecoration(
                      prefix: Icon(Icons.search_outlined,
                          color: context.general.colorScheme.onSecondary
                              .withOpacity(0.2))),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 90,
                  child: Observer(builder: (_) {
                    return buildListViewSocialUser(_viewModel);
                  }),
                )
              ],
            )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(LocaleKeys.home_social_cancel.locale)),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: context.general.appTheme.colorScheme.error,
          ),
          child: Text(
            LocaleKeys.home_social_next.locale,
          ),
        ),
      ],
    );
  }

  ListView buildListViewSocialUser(SocialViewModel _viewModel) {
    return ListView.builder(
        itemCount: _viewModel.socialUserList?.length ?? 0,
        itemBuilder: (context, index) {
          _viewModel.fetchAllUserLoading(index);
          return OpenContainerSocailWrapper(
            socialUser: _viewModel.socialUserList![index],
            closedBuilder: (context, action) {
              return FriendCard(
                socialUser: _viewModel.socialUserList![index],
                onPressed: action,
              );
            },
          );
        });
  }
}
