public class DateTimeMethodsDemo {
    public void calculateAgeInMonths() {
        // 1. Today' date
        date dttoday = date.today();
        // 2. Sait's Birthdate
        date sBdate = date.newInstance(1972, 07, 27);

        integer ageInMonths = sBdate.monthsBetween(dttoday);
        system.debug('Sait age in months is ' + ageInMonths);
    }

    public void calculateAgeInDays() {
        // 1. Today' date
        date dttoday = date.today();
        // 2. Sait's Birthdate
        date sBdate = date.newInstance(1972, 07, 27);

        integer ageInDays = sBdate.daysBetween(dttoday);
        system.debug('Sait age in days is ' + ageInDays);
    }
    public void printSubscriptionEndDate(){
        Date subscriptionStartDate = date.today();

        Date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('Subscription ends on ' + subscriptionEndDate);

        Integer endDateYear = subscriptionEndDate.year();
        system.debug('Subscription end year is' + endDateYear);


        Integer endDateMonth = subscriptionEndDate.month();
         system.debug('Subscription end month is ' + endDateMonth);

    }
    public void printOfferEndDateTime(){
        Datetime dtNow = datetime.now();

        Datetime dfOfferEnd = dtNow.addHours(51);
        system.debug('offer end date & time ' + dfOfferEnd);

        Date dateOfferEnd = dfOfferEnd.date();
        system.debug('date of offer end ' + dateOfferEnd);
    }
    public void birthDateToMilliSeconds(){
        datetime birthDate  = datetime.newInstance(1972, 07, 27, 12, 00, 00); 
        long longBirthDate = birthDate.getTime();
        system.debug('long birth date =>' + longBirthDate);
    }
}
