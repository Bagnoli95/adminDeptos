class ApiEndpoints {
  static final String baseUrl = 'http://127.0.0.1:80/backend/';
  static _AuthEndpoints authEndpoints = _AuthEndpoints();
  static _Clientes clientesABM = _Clientes();
}

//LOGIN ENDPOINTS
class _AuthEndpoints {
  final String login = 'login/login.php';
  final String registration = 'login/registro.php';

  final String enviarOtp = 'login/enviarOtpTelefono.php';
  final String validarOtp = 'login/validarOtpPassword.php';

  final String validarToken = 'login/validarToken.php';
}

//ABM ENDPOINTS
class _Clientes {
  final String ListClientes = 'clientes/clientesLista.php';
  final String DetalleCliente = 'clientes/clientesDetalle.php';
}
