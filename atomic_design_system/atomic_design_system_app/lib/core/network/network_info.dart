// ya que no estamos checando si el dispositivo está conectado a una red
// wifi o 4/5g y lo que vamos a hacer es tratar de establecer conexión a
// diferentes sitios webs; es más apropiedado llamar esta carpeta network
// de lo contrario se llamaría platform
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
