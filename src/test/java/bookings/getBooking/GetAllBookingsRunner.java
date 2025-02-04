package bookings.getBooking;

import com.intuit.karate.junit5.Karate;

public class GetAllBookingsRunner {
    @Karate.Test
    Karate testAllBookings() {
        return Karate.run("classpath:bookings/getBooking/getAllBookings.feature");
    }
}
