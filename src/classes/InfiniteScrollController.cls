/**
 * Created by alxan on 21.03.2020.
 */

public with sharing class InfiniteScrollController {
    @AuraEnabled
    public static String loadMoreData(Integer sizeLimit) {
        sizeLimit += 1;

        List<PricebookEntry> results = [
                SELECT Id, Product2.Name
                FROM PricebookEntry
                LIMIT :sizeLimit
        ];

        return JSON.serialize(results);
    }
}