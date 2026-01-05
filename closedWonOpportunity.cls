public class closedWonOpportunity{

    public static void closedAllRelatedOpportunity(List<opportunity> newopportunitylist, Map<Id, opportunity> oldMap){

        set<Id> accId = new set<Id>();

        for(opportunity newrecord : newopportunitylist){

            opportunity oldrecord = oldMap.containskey(newrecord.Id) ? oldMap.get(newrecord.Id) : null ;

            if(newrecord.Stage == 'CLosed Won' && newrecord.AccountId != null && (oldrecord == null || (oldrecord.Stage != newrecord.Stage))){
                accId.add(newrecord.AccountId);
            }
        }

        if(accId.isEmpty()){
            return;
        }

        List<opportunity> opplist = new List<opportunity>();

        for(opportunity opp : [Select Id, AccountId From opportunity Where AccountId IN :accId AND StageName NOT IN ('Closed Won', 'Closed Lost')]){

            opplist.add(new opportunity(Id = opp.Id, StageName = 'Closed Lost', CloseReason__c = 'Lost due to another Closed Won Opportunity'));

        }

        if(!opplist.isEmpty()){
            Database.update(opplist, false);
        }

    }
}