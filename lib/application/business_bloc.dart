import 'dart:async';
import 'package:yelpapp/data/repositories/business_repository.dart';

class BusinessBloc {
  final _businessesController = StreamController<List<dynamic>>();
  Stream<List<dynamic>> get businessesStream => _businessesController.stream;

  void fetchBusinesses() async {
    try {
      final businesses = await BusinessRepository.fetchBusinesses();
      _businessesController.sink.add(businesses);
    } catch (e) {
      _businessesController.addError(e);
    }
  }

  void dispose() {
    _businessesController.close();
  }
}
