/**
 * Created by alxan on 07.03.2020.
 */
({

    handleInfoEvt: function (component, event) {
        let productInfo = event.getParam('Index');
        //console.log('Body : ' + productInfo);
        component.set('v.index', productInfo);
        //console.log('Body (index)--> '+component.get('v.index'));
    },
    handleCategoryEvent: function (component, event) {
        let category = event.getParam('category');
        component.set('v.category', category);
        //console.log('Body (category): ' + component.get('v.category'));
    }
})