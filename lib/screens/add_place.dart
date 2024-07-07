import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placesapp/providers/user_places.dart';
import 'package:placesapp/widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  _savePlace() {
    final enterTitle = _titleController.text;
    if (enterTitle.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enterTitle);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new place')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'))
          ],
        ),
      ),
    );
  }
}
