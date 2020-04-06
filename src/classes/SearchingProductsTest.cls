/**
 * Created by alxan on 05.04.2020.
 */

@IsTest
private class SearchingProductsTest {
    @IsTest
    static void testGetProductsNameWithCount() {
        String products = SearchingProducts.getProductsName(10);
        System.assertNotEquals(null , products);
    }
    @IsTest
    static void testFetchAccountWithName(){
        List<PricebookEntry> products = SearchingProducts.fetchAccount('Centra',10000,'');
        System.assertNotEquals(null, products);
    }
    @IsTest
    static void testFetchAccountWithNameAndCategory(){
        List<PricebookEntry> products = SearchingProducts.fetchAccount('Centra',10000,'Battery');
        System.assertNotEquals(null, products);
    }
    @IsTest
    static void testFetchAccountWithCategory(){
        List<PricebookEntry> products = SearchingProducts.fetchAccount('',10000,'Battery');
        System.assertNotEquals(null, products);
    }
    @IsTest
    static void testFetchAccountWithErrorCategory(){
        List<PricebookEntry> products = SearchingProducts.fetchAccount('Centra',10000,'Light');
        System.assertEquals(null, products);
    }
    @IsTest
    static void testFetchAccountWithErrorName(){
        List<PricebookEntry> products = SearchingProducts.fetchAccount('cemtta',10000,'');
        System.assertEquals(null, products);
    }
}