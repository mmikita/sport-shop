public class SP_SportshopChatter {
    
    @InvocableMethod
    public static void PostToChatter(List<String> accLeadId){
        Lead lead = [Select id, CreatedById, name, createdby.Name from lead where id = :accLeadId[0]];
        
        ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
        feedItemInput.body = new ConnectApi.MessageBodyInput();
        feedItemInput.subjectId = '0F90900000114k1CAA';
        feedItemInput.body.messageSegments = new List<ConnectApi.MessageSegmentInput>();

        
        ConnectApi.EntityLinkSegmentInput accountLinkLink = new ConnectApi.EntityLinkSegmentInput();
        accountLinkLink.entityId = lead.CreatedById;
        feedItemInput.body.messageSegments.add(accountLinkLink);
        
        
        ConnectApi.TextSegmentInput message = new ConnectApi.TextSegmentInput();
        message.text = ' has created a new lead ';     
        feedItemInput.body.messageSegments.add(message);
        
        
        ConnectApi.EntityLinkSegmentInput leadLink = new ConnectApi.EntityLinkSegmentInput();
        leadLink.entityId = lead.id;
        feedItemInput.body.messageSegments.add(leadLink);
        
        
        

        
        
        ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), feedItemInput);
        
        
    }
}