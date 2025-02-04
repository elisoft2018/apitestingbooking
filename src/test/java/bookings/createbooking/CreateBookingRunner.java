package bookings.createbooking;

import com.intuit.karate.junit5.Karate;

public class CreateBookingRunner {
    @Karate.Test
    Karate testCreateBooking() {
        return Karate.run("classpath:bookings/createbooking/createBooking.feature");
    }
}
