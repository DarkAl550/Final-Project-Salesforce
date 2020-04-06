/**
 * Created by alxan on 06.04.2020.
 */

({
    reviewProduct:function(component, event){
        let action = component.get('c.getProductReviews');
        action.setParams({'name' : component.get('v.InfoProduct.Name')});
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === 'SUCCESS') {
                let resultData = response.getReturnValue();

                component.set('v.ReviewProduct', resultData);
                console.log(component.get('v.ReviewProduct'));
            }
        });
        $A.enqueueAction(action);
    },
    test:function(component){
        console.log('TEST');
    }
})