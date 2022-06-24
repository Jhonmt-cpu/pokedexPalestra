import 'package:hasura_connect/hasura_connect.dart';
import 'package:pokedex/app/helpers/values/strings.dart';

class ApiConfig {
  HasuraConnect get api => HasuraConnect(Strings.pokeApiUrl);
}
