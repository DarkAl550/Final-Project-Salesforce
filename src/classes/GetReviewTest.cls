@isTest
public class GetReviewTest {
	@isTest
    public static void testGetProductReviews(){
        Product2 prod = new Product2();
        prod.Name = 'Test';
        
        insert prod;
        
        Review__c rev = new Review__c();
        rev.ReviewText__c = 'BEST';
        rev.Rate__c = 4;
        
        List<Review__c> testRev = GetReview.getProductReviews(prod.Name);
        
        System.assertNotEquals(null, testRev);
    }
    @isTest
    public static void testSetProductReviews(){
        
    }
}