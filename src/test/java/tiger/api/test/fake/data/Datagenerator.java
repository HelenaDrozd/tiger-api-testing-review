package tiger.api.test.fake.data;

import com.github.javafaker.Faker;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Datagenerator {

	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName()
				+ faker.name().lastName()
				+ "@gmail.com";
	}
	
	public static String getAddrStreet() {
		Faker faker = new Faker();
		return faker.address().streetAddress();
	}

	public static String getAddrCity() {
		Faker faker = new Faker();
		return faker.address().city();
	}

	public static String getAddrState() {
		Faker faker = new Faker();
		return faker.address().state();
	}

	public static String getAddrZip() {
		Faker faker = new Faker();
		return faker.address().zipCode();
	}

	public static String getAddrCountryCode() {
		Faker faker = new Faker();
		return faker.address().countryCode();
	}

	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}

	public static String getDob() {
        Faker faker = new Faker(); 
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
	
//	public static void main(String[] args) {
//		System.out.println(getEmail());
//		System.out.println(getPhoneNumber());
//		System.out.println(getDob());
//	}
}
