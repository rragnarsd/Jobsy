import 'package:codehatch/models/link_model.dart';
import 'package:codehatch/services/link_service.dart';
import 'package:flutter/material.dart';

class LinkProvider extends ChangeNotifier {
  final LinkService _linkService = LinkService();

  List<LinkModel> _links = [];
  bool _isLoading = false;
  String? _error;

  List<LinkModel> get links => _links;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadLinks() async {
    _setLoading(true);
    _clearError();

    try {
      _links = await _linkService.getUserLinks();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addLink(LinkModel link) async {
    _setLoading(true);
    _clearError();

    try {
      await _linkService.addLink(link);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateLink(LinkModel link) async {
    _setLoading(true);
    _clearError();

    try {
      await _linkService.updateLink(link);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteLink(String linkId) async {
    _setLoading(true);
    _clearError();

    try {
      await _linkService.deleteLink(linkId);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void clearError() {
    _clearError();
  }
}
