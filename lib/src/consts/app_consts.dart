abstract class AppConsts {
  static const String baseApi = "http://swapi.dev/api/";

  //people
  static const String people =  "${baseApi}people/";
  static String peopleByName(String name) => "${baseApi}people/?search=$name";
}
