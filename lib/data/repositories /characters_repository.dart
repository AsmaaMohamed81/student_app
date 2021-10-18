
import 'package:student_app/data/models/character.dart';
import 'package:student_app/data/networking/api_provider.dart';
import 'package:student_app/utils/urls.dart';

class CharactersRepository {
  final ApiProvider apiProvider;

  CharactersRepository(this.apiProvider);
  
// final CharactersWebServices charactersWebServices;

// CharactersRepository(this.charactersWebServices);

// Future<List<Character>> getAllCharacters()async{
//  final characters = await charactersWebServices.getAllCharacters();
//   return characters.map((character) => Character.fromJson(character)).toList();

// }

  Future<List<Character>> getAllCharacters() async {
    final response = await apiProvider.getWithDio(
        charactersUrl
       );

    List<Character> characters = [];
    if (response['status'] == 200) {
      Iterable iterable = response['response'];
      characters = iterable.map((model) => Character.fromJson(model)).toList();
    }

    return characters;
  }
}
