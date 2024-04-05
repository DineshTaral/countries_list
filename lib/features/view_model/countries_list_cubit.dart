import 'dart:developer';
import 'package:country_list_project/features/data/models/countries_model.dart';
import 'package:country_list_project/features/data/repositiories/countries_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_list_state.dart';

class CountriesListCubit extends Cubit<CountryListState> {
  CountriesListCubit() : super(CountryListInitial());
  final CountriesRepository _countriesRepository = CountriesRepository();

  fetchCountries() {
    emit(CountryListLoading());
    _countriesRepository.getCountries().then((value) {
      if (value.isNotEmpty) {
        emit(CountryListLoaded(countriesList: value, searchCountriesList: const []));
      } else {
        emit(CountryListError(error: "Data Not Found"));
      }
    }).catchError((onError) {
      emit(CountryListError(error: "Something went wrong"));
    });
  }

  void searchCountry(String query) {
    final currentState = state;
    if (currentState is CountryListLoaded) {
      log("query is empty ************  $query  ${query.isEmpty}");

      if (query.isEmpty) {
        log("query is empty ##############");

        emit(CountryListLoaded(
            countriesList: currentState.countriesList,
            searchCountriesList:const []));
        return;
      }

      final List<CountriesModel> filteredCountries =
          currentState.countriesList.where((country) {
        return country.name?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();

      emit(CountryListLoaded(
          countriesList: currentState.countriesList,
          searchCountriesList: filteredCountries));
    }
  }
}
