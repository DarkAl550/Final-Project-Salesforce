/**
 * Created by alxan on 19.03.2020.
 */

public with sharing class NBRBService {
    public static void getRateByCodeAndDate() {

        List<Valute__C> val = Valute__c.getall().values();
        System.debug(val.size());
        System.debug(val[0].Name + ' ' + val[0].Value__c);
        System.debug(val[1].Name + ' ' + val[1].Value__c);
        System.debug(val[2].Name + ' ' + val[2].Value__c);


        if (val[0].Name == 'EUR') {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/' + val[0].Name + '?ParamMode=2');
            request.setMethod('GET');
            request.setTimeout(60000);
            HttpResponse response = new Http().send(request);
            Rate rate = (Rate) JSON.deserialize(response.getBody(), Rate.class);
            val[0].Value__c = rate.Cur_OfficialRate;
        }
        if (val[1].Name == 'USD') {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/' + val[1].Name + '?ParamMode=2');
            request.setMethod('GET');
            request.setTimeout(60000);
            HttpResponse response = new Http().send(request);
            Rate rate = (Rate) JSON.deserialize(response.getBody(), Rate.class);
            val[1].Value__c = rate.Cur_OfficialRate;
        }
        update val;

        //System.debug(val[0].Value__c);
        //System.debug((val[1].Value__c));


    }
    public class Rate {
        public Double Cur_OfficialRate;
    }
}