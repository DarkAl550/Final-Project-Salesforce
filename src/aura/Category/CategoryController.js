/**
 * Created by alxan on 29.03.2020.
 */
({


    Search: function (component, event, helper) {
        let sizeLimit = component.get('v.sizeLimit');


        var searchField = component.find('searchField');
        var check = component.get('v.searchKeyword');
        console.log('conroller -->' + check);
        var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        if (isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
            helper.loadData(component, sizeLimit);

        } else {
            // else call helper function
            helper.SearchHelper(component, event);
        }

        // console.log('Price --> ' + component.get('v.prices'));
        // console.log('CategoryProd --> ' + component.get('v.categoryProd'));
    },

})