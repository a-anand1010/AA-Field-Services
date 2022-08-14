public class NewCaseListController {
public List<Case> getNewCases() {
    List<Case> results = [Select id,CaseNumber from Case where Status='new'];
        
    
    return results;
}
}