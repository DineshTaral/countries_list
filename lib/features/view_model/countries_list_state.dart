part of 'countries_list_cubit.dart';

abstract class CountryListState extends Equatable {}

class CountryListInitial extends CountryListState {
  @override
  List<Object> get props => [];
}

class CountryListLoading extends CountryListState {
  @override
  List<Object> get props => [];
}

class CountryListLoaded extends CountryListState {
  final List<CountriesModel> countriesList;
  final List<CountriesModel> searchCountriesList;

  CountryListLoaded(
      {required this.countriesList, required this.searchCountriesList});

  @override
  List<Object> get props => [countriesList, searchCountriesList];
}

class CountryListError extends CountryListState {
  final String error;

  CountryListError({required this.error});

  @override
  List<Object> get props => [error];
}
