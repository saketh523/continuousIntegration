//Mark the item attribute as packed using a value of true
//Disable the button by marking the disabled attribute using a value of true
({
    packItem: function(component, event, helper) {
        var btnClicked = event.getSource();
        component.set("v.item.Packed__c",true);
        btnClicked.set("v.disabled",true);
    }
})