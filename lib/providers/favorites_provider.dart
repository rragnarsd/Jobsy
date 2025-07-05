import 'package:codehatch/services/favorite_service.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoriteService _favoriteService = FavoriteService();

  List<String> _favorites = [];
  bool _isLoading = false;
  String? _error;

  List<String> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadFavorites() async {
    _setLoading(true);
    _clearError();

    try {
      _favorites = await _favoriteService.getFavorites();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addFavorite(String jobId) async {
    _setLoading(true);
    _clearError();

    try {
      await _favoriteService.addFavorite(jobId);
      _favorites.add(jobId);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> removeFavorite(String jobId) async {
    _setLoading(true);
    _clearError();

    try {
      await _favoriteService.removeFavorite(jobId);
      _favorites.remove(jobId);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteAllFavorites() async {
    _setLoading(true);
    _clearError();

    try {
      await _favoriteService.deleteAllFavorites();
      _favorites.clear();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
  }

  void _clearError() {
    _error = null;
  }

  void _setError(String error) {
    _error = error;
  }
}
