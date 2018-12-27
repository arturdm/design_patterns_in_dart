import 'package:design_patterns_in_dart/structural/facade.dart';
import 'package:test_api/test_api.dart';

void main() {
  group("hotel facade", () {
    HotelFacade facade;
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
      final reservation =
          Reservation(from: from, to: to, roomNumber: room.number);

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
