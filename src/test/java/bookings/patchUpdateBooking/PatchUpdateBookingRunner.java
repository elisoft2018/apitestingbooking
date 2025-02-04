package bookings.patchUpdateBooking;

import com.intuit.karate.junit5.Karate;

public class PatchUpdateBookingRunner {

    @Karate.Test
    Karate testPatchUpdateBooking() {
        return Karate.run("classpath:bookings/patchUpdateBooking/patchUpdateBooking.feature");
    }
}
