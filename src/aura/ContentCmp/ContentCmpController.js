/**
 * Created by alxan on 10.03.2020.
 */
({
    doInit: function (component, event, helper) {
        let sizeLimit = component.get('v.sizeLimit');
        helper.loadData(component, sizeLimit);
    },

    infoEvent: function (component, event, helper) {

        let target = event.currentTarget.id;
        //console.log(target);
        //console.log(component.get('v.searchResult'));
        let products = component.get('v.searchResult');
        let product = products[target];
        //console.log('Price : ' + product.UnitPrice)
        component.set('v.info', target);
        // console.log('Content : '+ JSON.stringify(product));

        let infoEvt = component.getEvent('InfoEv');
        infoEvt.setParam('Index', product);

        infoEvt.fire();
    },

    addToCart: function (component, helper, event) {

        let target = component.get('v.info');
        console.log(target);
        //console.log(component.get('v.searchResult'));
        let products = component.get('v.searchResult');
        let product = products[target];
        //console.log('Price : ' + product.UnitPrice)

        let cart = component.get('v.cart');
        cart.push(product);
        //console.log('Content : ' + JSON.stringify(cart));

        let infoEvt = component.getEvent('CartEv');
        infoEvt.setParam('Cart', cart);
        //console.log('Add to cart!');
        infoEvt.fire();

    }
})