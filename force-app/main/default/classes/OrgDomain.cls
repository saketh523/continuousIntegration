public class OrgDomain { 
public String domain { get; set; } 

public OrgDomain() { 
domain = String.valueOf(System.URL.getOrgDomainUrl().toExternalForm()); 
} 
}