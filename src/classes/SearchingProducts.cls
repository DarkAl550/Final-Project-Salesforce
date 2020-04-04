/**
 * Created by alxan on 17.03.2020.
 */

public with sharing class SearchingProducts {
    //search product in pricebook
    @AuraEnabled
    public static List < PricebookEntry > fetchAccount(String searchKeyWord, Integer price, String category) {
        String query = '';
        List<Valute__C> val = Valute__c.getall().values();
        if(searchKeyWord != '' && searchKeyWord != null){
            query += ' AND Product2.Name LIKE \'' + '%' + searchKeyWord + '%' + '\'';
        }
        if(category != '' && category != null ){
            query += ' AND Product2.Family = \'' + category + '\'';
        }
        List < PricebookEntry > returnList = new List  < PricebookEntry > ();
        List < PricebookEntry > lstOfAccount = new List<PricebookEntry>();

        lstOfAccount = Database.query('SELECT id, Product2.Name, Product2.DisplayUrl, UnitPrice FROM PricebookEntry WHERE UnitPrice <= :price AND Product2.IsActive = TRUE' + query);



        for (PricebookEntry acc: lstOfAccount) {
            returnList.add(acc);
        }
        System.debug(returnList);
//        System.debug(query);
//        System.debug(category);
        return returnList;
    }
    // product from pricebook on start
    @AuraEnabled
    public static String getProductsName(Integer sizeLimit) {
        sizeLimit+=1;

        List<PricebookEntry> products = [SELECT UnitPrice, Product2.Name, Product2.DisplayUrl, Product2.Description FROM PricebookEntry
        WHERE Product2.IsActive = TRUE LIMIT :sizeLimit];


        System.debug(products);
        return JSON.serialize(products);

    }

}