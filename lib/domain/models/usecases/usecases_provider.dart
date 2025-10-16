import 'package:cinebox_app/data/repositories/repositories_provider.dart';
import 'package:cinebox_app/domain/models/usecases/get_movies_by_category_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
  );
}
