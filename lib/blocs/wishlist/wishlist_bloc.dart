import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListLoading());

  @override
  Stream<WishListState> mapEventToState(
    WishListEvent event,
  ) async* {
    if (event is StartWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapSAddWishListProducttoState(event, state);
    } else if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishListProducttoState(event, state);
    }
  }

  Stream<WishListState> _mapStartWishListToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishListLoaded();
    } catch (_) {}
  }

  Stream<WishListState> _mapSAddWishListProducttoState(
    AddWishListProduct event,
    WishListState state,
  ) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishListState> _mapRemoveWishListProducttoState(
    RemoveWishListProduct event,
    WishListState state,
  ) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
