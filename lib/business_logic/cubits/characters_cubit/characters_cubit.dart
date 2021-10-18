import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_app/data/models/character.dart';
import 'package:student_app/data/repositories%20/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  //  CharactersCubit get(context) => BlocProvider.of(context);

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }


  // bool value = true;

  // void changeValue(String value) {
  //   emit(CharactersInitial());
  //    emit(MyState( name: value));
   

  // }

  //  void initValue() {
  //    emit(MyState( name: 'Khaled'));
   

  // }
}
