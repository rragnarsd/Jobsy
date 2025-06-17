import 'package:flutter/material.dart';
import 'package:codehatch/models/workplace_model.dart';

class WorkplaceProvider extends ChangeNotifier {
  WorkplaceModel? _workplace;
  final List<WorkplaceModel> _workplaces = dummyWorkplaces;

  WorkplaceModel? get workplace => _workplace;
  List<WorkplaceModel> get workplaces => List.unmodifiable(_workplaces);

  void setWorkplace(WorkplaceModel workplace) {
    _workplace = workplace;
    notifyListeners();
  }

  WorkplaceModel? getWorkplaceById(String id) {
    try {
      return _workplaces.firstWhere((workplace) => workplace.id == id);
    } catch (e) {
      return null;
    }
  }

  bool get hasWorkplace => _workplace != null;
}
