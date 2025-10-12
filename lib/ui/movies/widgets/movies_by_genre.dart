import 'package:cinebox_app/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGenre extends ConsumerStatefulWidget {
  const MoviesByGenre({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesByGenreState();
}

class _MoviesByGenreState extends ConsumerState<MoviesByGenre> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: MoviesBox(
        title: 'Filmes encontrados',
        vertical: true,
      ),
    );
  }
}
