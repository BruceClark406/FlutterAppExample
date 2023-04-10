import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shortly_app/home/home.dart';
import 'package:shortly_app/view/view.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;
  setUp(() {
    storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  testWidgets('App returns home page', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(HomePage), findsOneWidget);
  });
}
