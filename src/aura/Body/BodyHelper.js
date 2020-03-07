/**
 * Created by alxan on 07.03.2020.
 */
({
    getProductsName : function( component ) {
                var action = component.get("c.getProductsName");

                action.setCallback(this, function(response) {
                    var state = response.getState(); //Checking response status
                    var result = JSON.stringify(response.getReturnValue());
                    if (component.isValid() && state === "SUCCESS")
                        component.set("v.prodList", response.getReturnValue());  // Adding values in Aura attribute variable.
                        console.log("Success!(Product)");
                    });
                $A.enqueueAction(action);
                }

})