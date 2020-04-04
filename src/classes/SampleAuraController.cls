/**
 * Created by alxan on 13.03.2020.
 */

public class SampleAuraController {

    //Get Contact List
    @AuraEnabled
    public static List<PricebookEntry> getContactList(Integer recordLimit, Integer recordOffset){
        Integer intLimit = Integer.valueof(recordLimit);
        Integer intOffset = Integer.valueof(recordOffset);
        List<PricebookEntry> conList = new List<PricebookEntry>();
        conList = [SELECT Id, Name, Product2.DisplayUrl FROM PricebookEntry LIMIT :intLimit Offset :intOffset];
        return conList;
    }

    //Get Total Number of Contacts
    @AuraEnabled
    public static Integer getTotalContacts(){
        AggregateResult results = [SELECT Count(Id) TotalProducts  From Product2];
        Integer totalContacts = (Integer)results.get('TotalProducts') ;
        return totalContacts;
    }

    //Delete Contact
    @AuraEnabled
    public static void deleteContact(Contact con){
        Delete con;
    }
}