import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/intervention.dart';

abstract class InterventionRepository {
  Future<Either<Failure, PageIntervention>> getPageIntervention(
      String status, int page, int size);
  Future<Either<Failure, InterventionModel>> getInterventionById(int id);
  Future<Either<Failure, InterventionModel>> addAppointement(
      int? uId, int? interid, String dateTime);
}
