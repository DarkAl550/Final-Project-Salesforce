/**
 * Created by alxan on 12.03.2020.
 */

public with sharing class ApexControllerLazyComponent {
    @AuraEnabled
    public static List < PricebookEntry > fetchAccts(Integer intOffSet) {

        return [ SELECT Id, Name, Product2.Name FROM PricebookEntry LIMIT 5 OFFSET : Integer.valueOf(intOffSet) ];

    }
}