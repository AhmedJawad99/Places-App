import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placesapp/models/place.dart';
import 'package:placesapp/providers/user_places.dart';
import 'package:placesapp/screens/add_place.dart';
import 'package:placesapp/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> userPlace = ref.watch(userPlacesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    final colors = [
      {'color': colorScheme.primary, 'name': 'primary'},
      {'color': colorScheme.primaryContainer, 'name': 'primaryContainer'},
      {'color': colorScheme.secondary, 'name': 'secondary'},
      {'color': colorScheme.secondaryContainer, 'name': 'secondaryContainer'},
      {'color': colorScheme.surface, 'name': 'surface'},
      {'color': colorScheme.error, 'name': 'error'},
      {'color': colorScheme.onPrimary, 'name': 'onPrimary'},
      {'color': colorScheme.onSecondary, 'name': 'onSecondary'},
      {'color': colorScheme.onSurface, 'name': 'onSurface'},
      {'color': colorScheme.onError, 'name': 'onError'},
      {'color': colorScheme.outline, 'name': 'outline'},
      {'color': colorScheme.shadow, 'name': 'shadow'},
      {'color': colorScheme.inverseSurface, 'name': 'inverseSurface'},
      {'color': colorScheme.onInverseSurface, 'name': 'onInverseSurface'},
      {'color': colorScheme.inversePrimary, 'name': 'inversePrimary'},
      {
        'color': colorScheme.surfaceContainerHighest,
        'name': 'surfaceContainerHighest'
      },
      {'color': colorScheme.onSurfaceVariant, 'name': 'onSurfaceVariant'},
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('your places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddPlaceScreen()));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: colors.map((color) {
                return Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      color: color['color'] as Color?,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    SizedBox(width: 8),
                    Text(
                      color['name'] as String,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlacesList(places: userPlace),
        ));
  }
}
