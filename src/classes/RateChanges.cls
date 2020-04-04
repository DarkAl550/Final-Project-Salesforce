/**
 * Created by alxan on 03.04.2020.
 */

public with sharing class RateChanges {
    @AuraEnabled
    public static Decimal changeRate(String name) {
        List<Valute__C> val = Valute__c.getall().values();
        Decimal rate;
        if (name == 'EUR') {
            rate = val[0].Value__c;
        } else if (name == 'USD') {
            rate = val[1].Value__c;
        } else {
            rate = val[2].Value__c;
        }

        System.debug(rate);
        return rate;
    }
}