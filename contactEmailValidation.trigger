trigger contactTrigger on contact(before insert){
    contactTriggerHandler.checkEmailBeforeInsert(Trigger.new);
}