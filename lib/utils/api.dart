import 'package:flash_cards/main.dart';

typedef UI = ReactiveStatelessWidget;

extension dynamicX on dynamic {
  Widget text() => Text(toString());
}

extension WidgetX on Widget {
  Widget pad() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }
}

mixin CRUD<E> {
  final crud = storage.box<E>();
  late final put = crud.put;
  late final get = crud.get;
  late final getAll = crud.getAll;
  late final remove = crud.remove;
  late final removeAll = crud.removeAll;
  late final putMany = crud.putMany;
  late final count = crud.count;
  Stream<List<E>> watch() {
    return crud
        .query()
        .watch(
          triggerImmediately: true,
        )
        .map(
      (query) {
        return query.find();
      },
    );
  }

  late final api = RM.injectStream(
    watch,
    initialState: getAll(),
  );
  List<E> call([E? item]) {
    if (item != null) put(item);
    return api.state;
  }

  final single = RM.inject<E>(() => throw UnimplementedError());
}
