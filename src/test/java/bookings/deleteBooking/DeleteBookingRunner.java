package bookings.deleteBooking;

import com.intuit.karate.junit5.Karate;

public class DeleteBookingRunner {
    @Karate.Test
    Karate testDeleteBooking() {
        return Karate.run("classpath:bookings/deleteBooking/deleteBooking.feature");
    }
}
