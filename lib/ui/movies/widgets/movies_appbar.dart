import 'package:cinebox_app/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppBar extends ConsumerStatefulWidget {
  const MoviesAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppBarState();
}

class _MoviesAppBarState extends ConsumerState<MoviesAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      foregroundColor: Colors.black,
      pinned: true,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        titlePadding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar Filme',
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
