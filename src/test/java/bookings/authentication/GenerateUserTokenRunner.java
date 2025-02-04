package bookings.authentication;

import com.intuit.karate.junit5.Karate;

public class GenerateUserTokenRunner {

    @Karate.Test
    Karate generateUserToken() {
        return Karate.run("classpath:bookings/authentication/generateUserToken.feature");
    }
}
