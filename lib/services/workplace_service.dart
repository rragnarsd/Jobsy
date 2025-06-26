import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:flutter/foundation.dart';

class WorkplaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                  debugPrint(
                    'Failed to parse workplace document: ${doc.id}, error: $e',
                  );
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
                  debugPrint(
                    'Failed to parse job document: ${doc.id}, error: $e',
                  );
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
