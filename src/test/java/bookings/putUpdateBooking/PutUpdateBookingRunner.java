package bookings.putUpdateBooking;

import com.intuit.karate.junit5.Karate;

public class PutUpdateBookingRunner {

    @Karate.Test
    Karate testPutUpdateBooking() {
        return Karate.run("classpath:bookings/putUpdateBooking/putUpdateBooking.feature");
    }
}
