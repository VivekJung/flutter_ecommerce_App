part of 'wishlist_bloc.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishListEvent {}

class AddWishListProduct extends WishListEvent {
  final Product product;
  const AddWishListProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishListProduct extends WishListEvent {
  final Product product;
  const RemoveWishListProduct(this.product);

  @override
  List<Object> get props => [product];
}
