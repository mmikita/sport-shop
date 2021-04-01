public without sharing class SP_leadFormController {
    public boolean isSurvey{get; set;}
    public String surveydsId{get; set;}
    public SP_leadFormController(ApexPages.StandardController stdController){
      isSurvey = Boolean.valueOf(System.currentPageReference().getParameters().get('survey'));
      // surveydsId = System.currentPageReference().getParameters().get('idd');
    }
}