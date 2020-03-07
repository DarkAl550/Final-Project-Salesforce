/**
 * Created by alxan on 07.03.2020.
 */
({
    getAccontRecord : function( component ) {
            var action = component.get("c.getAccountRecord"); //Calling Apex class controller 'getAccountRecord' method

            action.setCallback(this, function(response) {
                var state = response.getState(); //Checking response status
                var result = JSON.stringify(response.getReturnValue());
                if (component.isValid() && state === "SUCCESS")
                    component.set("v.accLst", response.getReturnValue());  // Adding values in Aura attribute variable.
                    console.log("Success!(Account)");
                });
            $A.enqueueAction(action);
            }
})