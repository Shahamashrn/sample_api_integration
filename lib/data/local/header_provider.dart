 class HeaderProvider {
  static const baseMap = {'Content-Type': 'application/json'};
  static final postLoginMap = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',

  };
  Map<String, String> call(){
    return baseMap;
  }
}