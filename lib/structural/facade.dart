import 'package:meta/meta.dart';

class RoomRepository {
  final List<Room> _rooms = List();

  void add(Room room) {
    assert(room != null);
    _rooms.add(room);
  }

  Iterable<Room> get rooms => List.unmodifiable(_rooms);
}

class Room {
  final String number;

  Room(this.number);

  @override
  String toString() => "Room $number";
}

class ReservationRepository {
  final List<Reservation> _reservations = List();

  Iterable<Reservation> get reservations => List.unmodifiable(_reservations);

  void add(Reservation reservation) => _reservations.add(reservation);
}

class Reservation {
  final DateTime from;
  final DateTime to;
  final String roomNumber;

  Reservation(
      {@required this.from, @required this.to, @required this.roomNumber})
      : assert(from.isBefore(to));
}

class HotelFacade {
  final RoomRepository _roomRepository;
  final ReservationRepository _reservationRepository;

  HotelFacade(this._roomRepository, this._reservationRepository)
      : assert(_roomRepository != null),
        assert(_reservationRepository != null);

  Iterable<Room> findVacantRooms(DateTime from, DateTime to) {
    assert(from.isBefore(to));
    return _roomRepository.rooms.where((room) => _isVacant(room, from, to));
  }

  bool _isVacant(Room room, DateTime from, DateTime to) {
    return _reservationRepository.reservations.every((reservation) =>
        reservation.roomNumber != room.number ||
        _intersects(reservation.from, reservation.to, from, to));
  }

  bool _intersects(DateTime firstFrom, DateTime firstTo, DateTime secondFrom,
          DateTime secondTo) =>
      firstFrom.isAfter(secondTo) || firstTo.isBefore(secondFrom);

  void addReservation(Reservation reservation) {
    assert(reservation != null);
    _reservationRepository.add(reservation);
  }

  Iterable<Reservation> findReservations(DateTime from, DateTime to) {
    return _reservationRepository.reservations.where((reservation) =>
        (reservation.from.isAfter(from) ||
            reservation.from.isAtSameMomentAs(from)) &&
        (reservation.to.isBefore(to) || reservation.to.isAtSameMomentAs(to)));
  }
}

main() {
  final DateTime from = DateTime.parse("2018-12-24");
  final DateTime to = from.add(Duration(days: 7));
  final roomRepository = RoomRepository()
    ..add(Room("309"))
    ..add(Room("404"))
    ..add(Room("409"));
  final reservationRepository = ReservationRepository();
  final facade = HotelFacade(roomRepository, reservationRepository);

  facade.addReservation(Reservation(from: from, to: to, roomNumber: "409"));
  Iterable<Room> vacantRooms = facade.findVacantRooms(from, to);

  print("${vacantRooms} available from $from to $to");
}
