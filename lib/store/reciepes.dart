import 'package:mobx/mobx.dart';
import 'package:my_first_flutter_app/model/reciepe.dart';

part 'reciepes.g.dart';

class ReciepesStore = ReciepesStoreState with _$ReciepesStore;

abstract class ReciepesStoreState with Store {
  @observable
  List<Reciepe> data = [];

  @observable
  bool inProgress = false;

  @observable
  bool isFetched = false;

  @action
  void storeReciepes(List<Reciepe> reciepes) {
    data = reciepes;
    isFetched = true;
    inProgress = false;
  }

  @action
  void loadReciepes(bool indicator) {
    isFetched = true;
    inProgress = indicator;
  }
}

final reciepesStore = ReciepesStore();
