import 'package:cinebox_app/ui/movies/widgets/movies_by_category.dart';
import 'package:cinebox_app/domain/models/usecases/usecases_provider.dart';
import 'package:cinebox_app/core/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_category_command.g.dart';

@riverpod
class GetMoviesByCategoryCommand extends _$GetMoviesByCategoryCommand {
  @override
  AsyncValue<MoviesByCategory?> build() {
    return const AsyncData(null);
  }

  Future<void> execute() async {
    state = AsyncLoading();
    final getMoviesByCategoryUC = ref.read(getMoviesByCategoryUsecaseProvider);
    final result = await getMoviesByCategoryUC.execute();
    state = switch (result) {
      Success(value: final moviesByCategory) => AsyncData(
        moviesByCategory as MoviesByCategory?,
      ), //corrigido pelo copilot para aceitar null
      Failure() => AsyncError(
        'Erro ao buscar filmes por categoria',
        StackTrace.current,
      ),
    };
  }
}
