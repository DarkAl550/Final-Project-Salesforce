/**
 * Created by alxan on 19.03.2020.
 */
({
    changeRate: function (component) {
        let action = component.get('c.changeRate');
        action.setParams({'name': component.get('v.rateName')});

        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === 'SUCCESS') {
                let resultData = response.getReturnValue();


                console.log('Rate : ' + resultData);
                let rateEvent = component.getEvent('RateEv');
                rateEvent.setParam('Rate', resultData);

                rateEvent.fire();

            }
        });
        $A.enqueueAction(action);

    },
    changeSymbol: function (component, event) {
        let name = component.get('v.rateName');
        let symbolEvent = component.getEvent('SymbolEv');
        if (name === 'USD') {
            symbolEvent.setParam('Symbol', ' $');
        } else if (name === 'EUR') {
            symbolEvent.setParam('Symbol', ' €');
        } else {
            symbolEvent.setParam('Symbol', ' Br');
        }
        symbolEvent.fire();
    }


})