part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {
   
}

final class SearchFailer extends SearchState {
  final String errorMessage;

  const SearchFailer({required this.errorMessage});
}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;

 const SearchSuccess({required this.books});
}
