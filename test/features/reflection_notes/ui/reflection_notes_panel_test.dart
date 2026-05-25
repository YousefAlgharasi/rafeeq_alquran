import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note_source_type.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/provider/reflection_notes_provider.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/repository/reflection_notes_repository.dart';
import 'package:rafeeq_alquran/features/reflection_notes/ui/widgets/reflection_notes_panel.dart';

void main() {
  testWidgets('adds, edits, and deletes a reflection note', (tester) async {
    final repository = _FakeReflectionNotesRepository();

    await tester.pumpWidget(
      _TestApp(
        repository: repository,
        child: const Scaffold(
          body: SingleChildScrollView(
            child: ReflectionNotesPanel(
              verseKey: '1:1',
              sourceType: ReflectionNoteSourceType.dailyAyah,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('What did you learn from this ayah?'), findsNothing);
    expect(find.text('No reflection notes saved for this ayah yet.'), findsOne);

    await tester.tap(find.text('Add reflection note'));
    await tester.pumpAndSettle();

    expect(find.text('What did you learn from this ayah?'), findsOneWidget);
    expect(
      find.text(
        'This is your personal note, not a religious explanation of the ayah.',
      ),
      findsWidgets,
    );

    await tester.enterText(find.byType(TextFormField), 'A personal lesson');
    await tester.tap(find.text('Save reflection note'));
    await tester.pumpAndSettle();

    expect(find.text('A personal lesson'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'An edited note');
    await tester.tap(find.text('Save reflection note'));
    await tester.pumpAndSettle();

    expect(find.text('An edited note'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    expect(find.text('No reflection notes saved for this ayah yet.'), findsOne);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.repository, required this.child});

  final ReflectionNotesRepository repository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        reflectionNotesRepositoryProvider.overrideWithValue(repository),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: child,
      ),
    );
  }
}

class _FakeReflectionNotesRepository implements ReflectionNotesRepository {
  final _notes = <ReflectionNote>[];
  var _nextId = 1;

  @override
  Future<ReflectionNote> addNote({
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
  }) async {
    final note = ReflectionNote(
      id: _nextId++,
      verseKey: verseKey,
      sourceType: sourceType,
      title: title,
      body: body,
      syncStatus: 'local',
      createdAt: DateTime.utc(2026, 5, 25),
      updatedAt: DateTime.utc(2026, 5, 25),
    );
    _notes.add(note);
    return note;
  }

  @override
  Future<ReflectionNote?> deleteNote(int id) async {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index == -1) {
      return null;
    }
    return _notes.removeAt(index);
  }

  @override
  Future<List<ReflectionNote>> getNotesForVerse(String verseKey) async {
    return _notes.where((note) => note.verseKey == verseKey).toList();
  }

  @override
  Future<ReflectionNote?> updateNote({
    required int id,
    required String body,
    String? title,
  }) async {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index == -1) {
      return null;
    }

    final current = _notes[index];
    final updated = ReflectionNote(
      id: current.id,
      verseKey: current.verseKey,
      sourceType: current.sourceType,
      title: title,
      body: body,
      syncStatus: current.syncStatus,
      createdAt: current.createdAt,
      updatedAt: DateTime.utc(2026, 5, 25, 1),
    );
    _notes[index] = updated;
    return updated;
  }
}
