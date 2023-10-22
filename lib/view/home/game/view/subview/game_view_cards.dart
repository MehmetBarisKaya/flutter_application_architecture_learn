part of '../game_view.dart';

extension _GameViewCard on GameView {
  Widget buildColumnNewCard(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().ext.toBuild(
        onSuccess: (data) {
          return Column(
            children: [
              HeaderButton(
                titleText: LocaleKeys.home_game_topDownload,
                onPressed: () {},
              ),
              GameGrid(
                gameModels: data ?? [],
                onSelected: (item, index) {},
              )
            ],
          );
        },
        loadingWidget: SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[200]!,
            child: const ListTile(
              leading: CircleAvatar(),
              title: Text('data'),
              subtitle: Text('data'),
            ),
          ),
        ),
        //data: <GameModel>[],
        notFoundWidget: Text("data"),
        onError: Text("data"));
  }

  Widget buildColumnUpdateCard(GameViewModel viewModel) {
    return viewModel.onTopGameItems().ext.toBuild(
        onSuccess: (data) {
          return Column(
            children: [
              HeaderButton(
                titleText: LocaleKeys.home_game_topDownload,
                onPressed: () {},
              ),
              GameGrid(
                gameModels: data ?? [],
                onSelected: (item, index) {},
              )
            ],
          );
        },
        loadingWidget: CircularProgressIndicator(),
        notFoundWidget: Text("data"),
        onError: Text("data"));
  }
}
