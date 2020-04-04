/**
 * Created by alxan on 09.03.2020.
 */
({
    handleCartEvent: function (component, event) {
        let productInfo = event.getParam('Cart');

        // console.log('Body : ' + productInfo);
        component.set('v.ToCart', productInfo);
        //console.log('Main (Cart) --> ' + component.get('v.ToCart'));

    },

    handleRateEvent: function (component, event) {
        let getRate = event.getParam('Rate');
        component.set('v.rate', getRate);
        //console.log('Rate(Main) : ' + component.get('v.rate'));
    },
    handleSymbolEvent: function (component, event) {
        let getSymbol = event.getParam('Symbol');
        component.set('v.symbol', getSymbol);
        //console.log('Symbol(Main) : ' + component.get('v.symbol'));
    },
})