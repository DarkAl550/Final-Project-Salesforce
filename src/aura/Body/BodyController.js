/**
 * Created by alxan on 07.03.2020.
 */
({
    doInit : function(component, event, helper) {
   var action = component.get("c.getProductsName"); //Calling Apex class controller 'getAccountRecord' method

               action.setCallback(this, function(response) {
                   var state = response.getState(); //Checking response status
                   var result = JSON.stringify(response.getReturnValue());
                   if (component.isValid() && state === "SUCCESS")
                       component.set("v.prodList", response.getReturnValue());  // Adding values in Aura attribute variable.
                       alert(result);
                       console.log("Success!(Product)");
                   });
               $A.enqueueAction(action);
               }





})