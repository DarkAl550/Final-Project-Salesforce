/**
 * Created by alxan on 29.03.2020.
 */
({
    SearchHelper: function (component, event) {
        // show spinner message
        component.find("Id_spinner").set("v.class", 'slds-show');
        var action = component.get("c.fetchAccount");
        action.setParams({
            'searchKeyWord': component.get("v.searchKeyword"),
            'price': component.get('v.prices'),
            'category': component.get('v.categoryProd'),
            'rate': component.get('v.rate')
        });
        action.setCallback(this, function (response) {
            // hide spinner when response coming from server
            component.find("Id_spinner").set("v.class", 'slds-hide');
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();

                // if storeResponse size is 0 ,display no record found message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", true);
                } else {
                    component.set("v.Message", false);
                }

                // set numberOfRecord attribute value with length of return value from server
                component.set("v.TotalNumberOfRecord", storeResponse.length);

                // set searchResult list with return value from server.
                component.set("v.searchResult", storeResponse);

                let categoryEvent = component.getEvent('CategoryEv');
                categoryEvent.setParam('category', component.get('v.searchResult'));
                categoryEvent.fire();
                //console.log('EvResult : ' + component.get('v.searchResult'));

            }
        });
        $A.enqueueAction(action);
    },
    loadData: function (component, sizeLimit) {
        /*Controller Method receive how many records need to bring*/
        let action = component.get('c.getProductsName');
        component.set('v.isLoadinig', true);
        action.setParams({
            'sizeLimit': sizeLimit,
            'rate': component.get('v.rate')
        });

        action.setCallback(this, function (response) {
            let state = response.getState();

            if (state === 'SUCCESS') {
                let jsonResult = response.getReturnValue();
                let resultData = JSON.parse(jsonResult);
                component.set('v.hasMore', resultData.length > sizeLimit);
                if (resultData.length > sizeLimit)
                    resultData.splice(resultData.length - 1, 1);
                component.set('v.searchResult', resultData);
                let categoryEvent = component.getEvent('CategoryEv');
                categoryEvent.setParam('category', component.get('v.searchResult'));
                categoryEvent.fire();
                //console.log('EvResult : ' + component.get('v.searchResult'));

            }
        });
        $A.enqueueAction(action);
    },
})