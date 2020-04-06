/**
 * Created by alxan on 06.04.2020.
 */

public with sharing class GetReview {
    @AuraEnabled
    public static List<Review__c> getProductReviews(String name){
        List<Review__c> rev = new List<Review__c>();
        rev = [SELECT ReviewText__c, Rate__c FROM Review__c WHERE Product__r.Name =:name];
        System.debug(rev);
        return rev;
    }
    @AuraEnabled
    public static void setProductReviews(String text, Integer rate, String name, Id productId){
        Review__c newReview = new Review__c();
        
        newReview.Name = 'Review: ' + name;
        newReview.ReviewText__c = text;
        newReview.Rate__c = rate;
        newReview.Product__c = productId;

        insert newReview;
    }
}