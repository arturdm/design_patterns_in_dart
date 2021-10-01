import 'package:test/test.dart';

class RoomRepository {
  final List<Room> _rooms = [];

  void add(Room room) {
    _rooms.add(room);
  }

  Iterable<Room> get rooms => List.unmodifiable(_rooms);
}

class Room {
  final String number;

  const Room(this.number);

  @override
  String toString() => "Room $number";
}

class ReservationRepository {
  final List<Reservation> _reservations = [];

  Iterable<Reservation> get reservations => List.unmodifiable(_reservations);

  void add(Reservation reservation) => _reservations.add(reservation);
}

class Reservation {
  final DateTime from;
  final DateTime to;
  final String roomNumber;

  Reservation({required this.from, required this.to, required this.roomNumber}) : assert(from.isBefore(to));
}

class HotelFacade {
  final RoomRepository _roomRepository;
  final ReservationRepository _reservationRepository;

  const HotelFacade(this._roomRepository, this._reservationRepository);

  Iterable<Room> findVacantRooms(DateTime from, DateTime to) {
    assert(from.isBefore(to));
    return _roomRepository.rooms.where((room) => _isVacant(room, from, to));
  }

  bool _isVacant(Room room, DateTime from, DateTime to) {
    return _reservationRepository.reservations.every((reservation) =>
        reservation.roomNumber != room.number || _intersects(reservation.from, reservation.to, from, to));
  }

  bool _intersects(DateTime firstFrom, DateTime firstTo, DateTime secondFrom, DateTime secondTo) =>
      firstFrom.isAfter(secondTo) || firstTo.isBefore(secondFrom);

  void addReservation(Reservation reservation) {
    _reservationRepository.add(reservation);
  }

  Iterable<Reservation> findReservations(DateTime from, DateTime to) {
    return _reservationRepository.reservations.where((reservation) =>
        (reservation.from.isAfter(from) || reservation.from.isAtSameMomentAs(from)) &&
        (reservation.to.isBefore(to) || reservation.to.isAtSameMomentAs(to)));
  }
}

void main() {
  group("hotel facade", () {
    late HotelFacade facade;
    Room room = Room("404");
    DateTime from = DateTime(2018, 12, 24);
    DateTime to = DateTime(2018, 12, 30);

    void initializeFacade() {
      final roomRepository = RoomRepository()..add(room);
      final reservationRepository = ReservationRepository();
      facade = HotelFacade(roomRepository, reservationRepository);
    }

    group("when adding reservation", () {
      initializeFacade();
      final reservation = Reservation(from: from, to: to, roomNumber: room.number);

      facade.addReservation(reservation);

      test("should have a reservation for a date range", () {
        final foundReservations = facade.findReservations(from, to);
        expect(foundReservations.length, equals(1));
        expect(foundReservations.elementAt(0), equals(reservation));
      });

      test("should have no free rooms left", () {
        final rooms = facade.findVacantRooms(from, to);
        expect(rooms, isEmpty);
      });
    });

    test("should find empty room", () {
      initializeFacade();

      final rooms = facade.findVacantRooms(from, to);

      expect(rooms.length, equals(1));
    });
  });
}
