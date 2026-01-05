trigger opportunityTrigger on opportunity(after update){
    closedWonOpportunity.closedAllRelatedOpportunity(Trigger.new, Trigger.oldMap);
}