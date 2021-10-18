part of 'characters_cubit.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharactersInitial extends CharactersState {
  
  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;


  CharactersLoaded(this.characters, );
  @override
  List<Object> get props => [characters];
}

class CharactersError extends CharactersState {
  @override
  List<Object> get props => [];
}


class ButtonNameChangeState extends CharactersState {

  @override
  List<Object> get props => [];
}


// class MyState extends CharactersState {
//   final String name;

//   MyState( {this.name='khaled'});

//   @override
//   List<Object> get props => [];

//   // == and hashCode overrides...
// }


// class ButtonNameSuccessState extends CharactersState {

//   @override
//   List<Object> get props => [];
// }