import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_view_model.g.dart';

enum MoviesViewEnum {
  byCategory,
  bySearch,
  byGenre,
}

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  @override
  MoviesViewEnum build() => MoviesViewEnum.byCategory;

  void changeView(MoviesViewEnum view) {
    state = view;
    Future.delayed(
      Duration(milliseconds: 200),
    );
  }
}
