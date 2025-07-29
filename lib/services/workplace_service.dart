import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:flutter/foundation.dart';

class WorkplaceException implements Exception {
  final String message;
  WorkplaceException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing workplace and job data in Firestore.
/// This service provides stream-based access to workplace and job collections
/// for real-time updates. It does not require user authentication as it
/// provides public data access.
class WorkplaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stream of all workplaces from the workplaces collection.
  /// Returns a stream of WorkplaceModel objects with real-time updates.
  /// Handles errors gracefully by returning an empty list.
  Stream<List<WorkplaceModel>> getWorkplacesStream() {
    return _firestore
        .collection('workplaces')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                try {
                  return WorkplaceModel.fromJson(doc.data());
                } catch (e) {
                  debugPrint('Error parsing workplace document ${doc.id}: $e');
                  return null;
                }
              })
              .whereType<WorkplaceModel>()
              .toList();
        })
        .handleError((error, stackTrace) {
          debugPrint('Error fetching workplaces: $error\n$stackTrace');
          return <WorkplaceModel>[];
        });
  }

  /// Stream of all jobs from the jobs collection.
  /// Returns a stream of JobModel objects with real-time updates.
  /// Handles errors gracefully by returning an empty list.
  Stream<List<JobModel>> getJobsStream() {
    return _firestore
        .collection('jobs')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                try {
                  return JobModel.fromJson(doc.data());
                } catch (e) {
                  debugPrint('Error parsing job document ${doc.id}: $e');
                  return null;
                }
              })
              .whereType<JobModel>()
              .toList();
        })
        .handleError((error, stackTrace) {
          debugPrint('Error fetching jobs: $error\n$stackTrace');
          return <JobModel>[];
        });
  }
}
