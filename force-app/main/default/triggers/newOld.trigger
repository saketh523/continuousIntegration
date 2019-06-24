trigger newOld on Account (before insert,after insert,before update, after update) {
   system.debug('trigger.new'+trigger.new);
   system.debug('trigger.old'+trigger.old);
   
   if(trigger.isInsert && trigger.isbefore)
   {
      system.debug('## IN trigger.isInsert && trigger.isbefore ###');
       system.debug(' Trigger.new '+trigger.new);
       system.debug(' Trigger.old '+trigger.old);

   }
   
   if(trigger.isInsert && trigger.isafter)
   {
      system.debug(' Trigger.new '+trigger.new);
       system.debug(' Trigger.old '+trigger.old);

   }
   
   if(trigger.isUpdate && trigger.isbefore)
   {
       system.debug(' Trigger.new '+trigger.new);
       system.debug(' Trigger.old '+trigger.old);

   }
   
       if(trigger.isUpdate && trigger.isAfter)
       {
           system.debug(' Trigger.new '+trigger.new);
       system.debug(' Trigger.old '+trigger.old);

           
       }

   

}