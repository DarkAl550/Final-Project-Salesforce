/**
 * Created by alxan on 07.03.2020.
 */

public class productsForCatalogOnPage {
    @AuraEnabled
    public static List<Product2> getProductsName()
    {
        List<Product2> products = new List<Product2>();
        products = [SELECT Name, ProductCode from Product2];

        System.debug(products);
        return products;

    }
}