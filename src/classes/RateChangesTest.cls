/**
 * Created by alxan on 06.04.2020.
 */

@IsTest
private class RateChangesTest {
    @IsTest
    static void testChangeRateFalseName() {
        Decimal testRate = RateChanges.changeRate('Test');
        System.assertEquals(1, testRate);
    }
    @IsTest
    static void testChangeRateUSD(){
        Decimal testRate = RateChanges.changeRate('USD');
        System.assertEquals(2.5846,testRate);
    }
    @IsTest
    static void testChangeRateEUR(){
        Decimal testRate = RateChanges.changeRate('EUR');
        System.assertEquals(2.7943,testRate);
    }
    
	 
}