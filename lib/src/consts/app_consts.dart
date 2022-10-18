abstract class AppConsts {
  static const String baseApi = "http://swapi.dev/api/";

  //people
  static const String people = "people/";
  static String peopleByName(String name) => "people/?search=$name";
}
