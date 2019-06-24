trigger AccountTrigger on Account (
        before insert, after insert,
        before update, after update) {
    
    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            system.debug('you are before update');
            new AccountTriggerHandler(Trigger.new, Trigger.oldMap).beforeUpdate();
        }
    }
    else if (Trigger.isInsert) {
        system.debug('you are here before insert in trigger ');
        if (Trigger.isBefore) {
            new AccountTriggerHandler(Trigger.new, Trigger.oldMap).beforeInsert();
        }
    }
   if (Trigger.isUpdate) {
       if (Trigger.isAfter) {
           new AccountTriggerHandler(Trigger.new, Trigger.oldMap).afterUpdate();
       }
   }
   else if (Trigger.isInsert) {
       if (Trigger.isAfter) {
           new AccountTriggerHandler(Trigger.new, Trigger.oldMap).afterInsert();
       }
   }
}