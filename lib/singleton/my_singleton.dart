import 'package:sales_track_nex/database/nex_database.dart';

class DatabaseSingleton {
  NexDatabase _instance;
  NexDatabase get database {
    return _instance ??= NexDatabase();
  }
}
