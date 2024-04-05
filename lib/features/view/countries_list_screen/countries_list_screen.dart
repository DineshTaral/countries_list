import 'package:country_list_project/features/view/widgets/country_item_widget.dart';
import 'package:country_list_project/features/view_model/countries_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesListScreen extends StatelessWidget {
  CountriesListScreen({super.key});

  final _cubit = CountriesListCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries List"),
      ),
      body: BlocProvider(
        create: (ctx) {
          _cubit.fetchCountries();
          return _cubit;
        },
        child: BlocBuilder<CountriesListCubit, CountryListState>(
            builder: (context, state) {
          if (state is CountryListLoading) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CountryListLoaded) {
            return Column(
              children: [
                TextField(
                  onChanged: (value) {
                    context.read<CountriesListCubit>().searchCountry(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search Country',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (ctx, index) {
                        return state.searchCountriesList.isNotEmpty
                            ? CountryItemWidget(
                                flag: state
                                    .searchCountriesList[index].media?.flag,
                                name: state.searchCountriesList[index].name,
                              )
                            : CountryItemWidget(
                                flag: state.countriesList[index].media?.flag,
                                name: state.countriesList[index].name,
                              );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: state.searchCountriesList.isNotEmpty
                          ? state.searchCountriesList.length
                          : state.countriesList.length),
                ),
              ],
            );
          } else if (state is CountryListError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
