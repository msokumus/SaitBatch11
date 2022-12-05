public class DatetimeAssignment {
    public void diffofDate() {
        date varTomorrowDate = date.newInstance(2022, 11, 15);
        system.debug('Tomorrow Date is: ' + varTomorrowDate);
        date varTodaysDate = date.newInstance(2022, 11, 14);
        system.debug('Today is: ' + varTodaysDate);
        integer daysDifference = varTodaysDate.daysBetween(varTomorrowDate);
        system.debug('the days difference between these two variables: ' + daysDifference);
    }
    public void Timecheck() {
        Datetime varTomorrowDatetime = Datetime.newInstance(2022, 11, 15, 07, 00, 00);
        system.debug('TDT ' + varTomorrowDatetime);
        Datetime var10DaysDatetime = datetime.newInstancegmt(2022, 11, 24, 09, 00, 00);
        system.debug('10 Days: ' + var10DaysDatetime);
        long varDatetimeLong = 12339874361L;
        system.debug('Long: ' + varDatetimeLong);
        Datetime add7Days = varTomorrowDatetime.addDays(7);
        system.debug('Add 7 Days: ' + add7Days);
        Datetime add10Days = var10DaysDatetime.addDays(10);
        system.debug('Add 10 Days: ' + add10Days);
    }
}
