import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/reflection_note.dart';
import '../../logic/entity/reflection_note_source_type.dart';
import '../../logic/provider/reflection_notes_provider.dart';

class ReflectionNotesPanel extends ConsumerWidget {
  const ReflectionNotesPanel({
    required this.verseKey,
    required this.sourceType,
    super.key,
  });

  final String verseKey;
  final ReflectionNoteSourceType sourceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final notes = ref.watch(
      reflectionNotesProvider(ReflectionNotesRequest(verseKey: verseKey)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(
              localizations.reflectionNotes,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            OutlinedButton.icon(
              onPressed: () => _showNoteDialog(context, ref),
              icon: const Icon(Icons.note_add_outlined),
              label: Text(localizations.addReflectionNote),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          localizations.reflectionNoteNotTafsir,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        notes.when(
          data: (items) {
            if (items.isEmpty) {
              return Text(localizations.noReflectionNotes);
            }
            return Column(
              children: [
                for (final note in items)
                  _ReflectionNoteTile(
                    note: note,
                    onEdit: () => _showNoteDialog(context, ref, note: note),
                    onDelete: () async {
                      await ref
                          .read(reflectionNotesControllerProvider)
                          .deleteNote(verseKey: verseKey, id: note.id);
                    },
                  ),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ],
    );
  }

  Future<void> _showNoteDialog(
    BuildContext context,
    WidgetRef ref, {
    ReflectionNote? note,
  }) async {
    final localizations = AppLocalizations.of(context);
    final controller = TextEditingController(text: note?.body ?? '');
    final formKey = GlobalKey<FormState>();

    final body = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            note == null
                ? localizations.addReflectionNote
                : localizations.editReflectionNote,
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              minLines: 4,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: localizations.reflectionNotePersonalLabel,
                hintText: localizations.reflectionNotePrompt,
                helperText: localizations.reflectionNoteNotTafsir,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localizations.requiredField;
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(localizations.cancel),
            ),
            FilledButton.icon(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pop(controller.text.trim());
                }
              },
              icon: const Icon(Icons.save_outlined),
              label: Text(localizations.saveReflectionNote),
            ),
          ],
        );
      },
    );

    if (body == null) {
      return;
    }

    final notesController = ref.read(reflectionNotesControllerProvider);
    if (note == null) {
      await notesController.addNote(
        verseKey: verseKey,
        sourceType: sourceType,
        body: body,
      );
    } else {
      await notesController.updateNote(
        verseKey: verseKey,
        id: note.id,
        body: body,
      );
    }
  }
}

class _ReflectionNoteTile extends StatelessWidget {
  const _ReflectionNoteTile({
    required this.note,
    required this.onEdit,
    required this.onDelete,
  });

  final ReflectionNote note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(note.body),
      subtitle: Text(localizations.reflectionNotePersonalLabel),
      trailing: Wrap(
        spacing: 4,
        children: [
          IconButton(
            tooltip: localizations.editReflectionNote,
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            tooltip: localizations.deleteReflectionNote,
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
