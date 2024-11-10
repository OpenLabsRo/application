const String apiURL = "http://localhost:6666";

const Map<String, String> basicHeader = <String, String>{
  'Content-Type': 'application/json'
};

Map<String, String> authHeader(String token) {
  return <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
