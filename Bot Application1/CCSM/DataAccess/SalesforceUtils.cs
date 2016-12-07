using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Protocols;
using CCSM.BusinessObjects;
using CCSM.SFAccess;



/// <summary>
/// Summary description for SalesforceUtils
/// </summary>

namespace CCSM.DataAccess
{
    public class SalesforceUtils
    {
       private SforceService binding;
        string username;
        string password;
        Integrations intgr;
               
        private BaseCompany company;
        public SalesforceUtils(BaseCompany company)
        {
            this.company = company;
            this.intgr = company.Intgr;

            //if the company doesn't have basic SF access info
            if (intgr == null || String.IsNullOrEmpty(intgr.SFuser))
                throw new Exception("You need to Setup SF access!");

            username = intgr.SFuser;
            password = intgr.SFpwd + intgr.SFToken;
        }


        public Subscription lookUpSubscription(string AccountId, Subscription subscIn)
        {
            return subscIn;
        }


        public string createCTA(string Subject,
           string Description,
           CUser user)
        {
            //to use in the CTA object for Gainsight
            /*JBCXM__Account__c, 
             * JBCXM__Assignee__c, 
             * JBCXM__DueDate__c, 
             * JBCXM__Priority__c, 
             * JBCXM__Reason__c, 
             * JBCXM__Stage__c, 
             * JBCXM__Type__c,  = 'a3SG000000073q9MAA'
             * JBCXM__TypeName__c,
             * */

            //the id to return
            string idcreated = "";

            //first login
            if (!login()) throw new Exception("Could not login to Salesforce");
                       
            try
            {
                // Create a new sObject of type Contact
                // and fill out its fields.
                sObject CTA = new SFAccess.sObject();
                System.Xml.XmlElement[] CTAFields = new System.Xml.XmlElement[8];

                // Create the ticket's fields
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                CTAFields[0] = doc.CreateElement("JBCXM__Account__c");
                CTAFields[0].InnerText = user.ExternalSystemId;
                CTAFields[1] = doc.CreateElement("JBCXM__Assignee__c");
                CTAFields[1].InnerText = "pkumar"; //------------------------------------what is this one? id
                CTAFields[2] = doc.CreateElement("JBCXM__DueDate__c");
                CTAFields[2].InnerText = DateTime.Now.ToString();
                CTAFields[3] = doc.CreateElement("JBCXM__Priority__c"); //Alert Severity
                CTAFields[3].InnerText = "a3SG00000005SJQMA2"; //-------------------------------------high priority
                CTAFields[4] = doc.CreateElement("JBCXM__Stage__c");//Alert STatus
                CTAFields[4].InnerText = "a3SG000000073q9MAA";//---------------- stands for Open - this is like a status
               // CTAFields[5] = doc.CreateElement("JBCXM__Type__c");
                //CTAFields[5].InnerText = "a5UG0000000GoSUMA0";//--------------------------------------what is type id ; 
                CTAFields[6] = doc.CreateElement("JBCXM__TypeName__c");
                CTAFields[6].InnerText = "Event";//--------------------------------------Event
                                                 //field to set          picklist Category      other  
                                                 //JBCXM__Priority__c    Alert Severity
                                                 //JBCXM__Stage__c       Alert Status
                                                 //JBCXM__Reason__c      Alert Reason
                                                 //JBCXM__TypeName__c                           ? different object - type of CTA?  event or trial
                                                 //JBCXM__Account__c                            from account object
                                                 //JBCXM__Assignee__c                           this is from a user
                                                 //JBCXM__DueDate__c                            user input
                                                 //JBCXM__Comments__c                           user input


                CTA.type = "JBCXM__CTA__c";
                CTA.Any = CTAFields;

                // Add this sObject to an array
                sObject[] CTAList = new sObject[1];
                CTAList[0] = CTA;

                // Make a create call and pass it the array of sObjects 
                SaveResult[] results = binding.create(CTAList);
                // Iterate through the results list
                // and write the ID of the new sObject
                // or the errors if the object creation failed.
                // In this case, we only have one result
                // since we created one ticket.
                for (int j = 0; j < results.Length; j++)
                {
                    if (results[j].success)
                    {
                        Console.Write("\nA CTA was created with an ID of: "
                                        + results[j].id);
                        idcreated = results[j].id;
                    }
                    else
                    {
                        // There were errors during the create call,
                        // go through the errors array and write
                        // them to the console
                        for (int i = 0; i < results[j].errors.Length; i++)
                        {
                            Error err = results[j].errors[i];
                            Console.WriteLine("Errors were found on item " + j.ToString());
                            Console.WriteLine("Error code is: " + err.statusCode.ToString());
                            Console.WriteLine("Error message: " + err.message);
                        }
                    }
                }
            }
            catch (SoapException e)
            {
                Console.WriteLine("An unexpected error has occurred: " + e.Message +
                    " Stack trace: " + e.StackTrace);
            }
            //now logout
            logout();
            return idcreated;



        }

        public string createCase(string Subject,
           string Description,
           CUser user)
        {

            string ph = user.TextPhone; //check which phone to use
            if (String.IsNullOrEmpty(ph))  ph = user.OfficePhone;
            
            return createCase(Subject, Description, user.BusinessName, user.Email, user.Username, ph, user.ExternalSystemId);           
        }

        private string createCase(string Subject,
           string Description,
           string SuppliedCompany,
           string SuppliedEmail,
           string SuppliedName,
           string SuppliedPhone, 
           string accountId)
        {

            string idcreated = "";
            //first login
            if (!login()) throw new Exception("Could not login to Salesforce");

            int hasAcctId = 0;
            if (!String.IsNullOrEmpty(accountId)) hasAcctId = 1;

            //Subject Description	SuppliedCompany	SuppliedEmail	SuppliedName	SuppliedPhone Status Origin 
            try
            {
                // Create a new sObject of type Contact
                // and fill out its fields.
                sObject ticket = new SFAccess.sObject();
                System.Xml.XmlElement[] ticketFields = new System.Xml.XmlElement[7 + hasAcctId];

                // Create the ticket's fields
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                ticketFields[0] = doc.CreateElement("Subject");
                ticketFields[0].InnerText = Subject;
                ticketFields[1] = doc.CreateElement("Description");
                ticketFields[1].InnerText = Description;
                ticketFields[2] = doc.CreateElement("SuppliedCompany");
                ticketFields[2].InnerText = SuppliedCompany;
                ticketFields[3] = doc.CreateElement("SuppliedEmail");
                ticketFields[3].InnerText = SuppliedEmail;
                ticketFields[4] = doc.CreateElement("SuppliedName");
                ticketFields[4].InnerText = SuppliedName;
                ticketFields[5] = doc.CreateElement("SuppliedPhone");
                ticketFields[5].InnerText = SuppliedPhone;

                //if we have an account id, add it to the mix to assign it to an account
                if (hasAcctId == 1)
                {
                    ticketFields[7] = doc.CreateElement("AccountId");
                    ticketFields[7].InnerText = accountId;
                }



                    ticket.type = "Case";
                ticket.Any = ticketFields;

                // Add this sObject to an array
                sObject[] ticketList = new sObject[1];
                ticketList[0] = ticket;

                // Make a create call and pass it the array of sObjects 
                SaveResult[] results = binding.create(ticketList);
                // Iterate through the results list
                // and write the ID of the new sObject
                // or the errors if the object creation failed.
                // In this case, we only have one result
                // since we created one ticket.
                for (int j = 0; j < results.Length; j++)
                {
                    if (results[j].success)
                    {
                        Console.Write("\nA ticket was created with an ID of: "
                                        + results[j].id);
                        idcreated = results[j].id;
                    }
                    else
                    {
                        // There were errors during the create call,
                        // go through the errors array and write
                        // them to the console
                        for (int i = 0; i < results[j].errors.Length; i++)
                        {
                            Error err = results[j].errors[i];
                            Console.WriteLine("Errors were found on item " + j.ToString());
                            Console.WriteLine("Error code is: " + err.statusCode.ToString());
                            Console.WriteLine("Error message: " + err.message);
                        }
                    }
                }
            }
            catch (SoapException e)
            {
                Console.WriteLine("An unexpected error has occurred: " + e.Message +
                    " Stack trace: " + e.StackTrace);
            }
            //now logout
            logout();
            return idcreated;



        }
        public void createSample()
        {
            try
            {
                // Create a new sObject of type Contact
                // and fill out its fields.
                sObject contact = new SFAccess.sObject();
                System.Xml.XmlElement[] contactFields = new System.Xml.XmlElement[6];

                // Create the contact's fields
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                contactFields[0] = doc.CreateElement("FirstName");
                contactFields[0].InnerText = "Otto";
                contactFields[1] = doc.CreateElement("LastName");
                contactFields[1].InnerText = "Jespersen";
                contactFields[2] = doc.CreateElement("Salutation");
                contactFields[2].InnerText = "Professor";
                contactFields[3] = doc.CreateElement("Phone");
                contactFields[3].InnerText = "(999) 555-1234";
                contactFields[4] = doc.CreateElement("Title");
                contactFields[4].InnerText = "Philologist";

                contact.type = "Contact";
                contact.Any = contactFields;

                // Add this sObject to an array
                sObject[] contactList = new sObject[1];
                contactList[0] = contact;

                // Make a create call and pass it the array of sObjects 
                SaveResult[] results = binding.create(contactList);
                // Iterate through the results list
                // and write the ID of the new sObject
                // or the errors if the object creation failed.
                // In this case, we only have one result
                // since we created one contact.
                for (int j = 0; j < results.Length; j++)
                {
                    if (results[j].success)
                    {
                        Console.Write("\nA contact was created with an ID of: "
                                        + results[j].id);
                    }
                    else
                    {
                        // There were errors during the create call,
                        // go through the errors array and write
                        // them to the console
                        for (int i = 0; i < results[j].errors.Length; i++)
                        {
                            Error err = results[j].errors[i];
                            Console.WriteLine("Errors were found on item " + j.ToString());
                            Console.WriteLine("Error code is: " + err.statusCode.ToString());
                            Console.WriteLine("Error message: " + err.message);
                        }
                    }
                }
            }
            catch (SoapException e)
            {
                Console.WriteLine("An unexpected error has occurred: " + e.Message +
                    " Stack trace: " + e.StackTrace);
            }
        }
        private void logout()
        {
            try
            {
                binding.logout();
                Console.WriteLine("Logged out.");
            }
            catch (SoapException e)
            {
                // Write the fault code to the console 
                Console.WriteLine(e.Code);

                // Write the fault message to the console 
                Console.WriteLine("An unexpected error has occurred: " + e.Message);

                // Write the stack trace to the console 
                Console.WriteLine(e.StackTrace);
            }
        }
        private bool login()
        {
            Console.Write("Enter username: ");
            //string username = "bplaster@completecsm.com";// Console.ReadLine();
            Console.Write("Enter password: ");
            //string password = "P@ssw0rd10ESuICWpWj4sAcJLOhplSGiaj";// Console.ReadLine();

            // Create a service object 
            binding = new SforceService();

            // Timeout after a minute 
            binding.Timeout = 60000;

            // Try logging in   
            LoginResult lr;
            try
            {

                Console.WriteLine("\nLogging in...\n");
                lr = binding.login(username, password);
            }

            // ApiFault is a proxy stub generated from the WSDL contract when     
            // the web service was imported 
            catch (SoapException e)
            {
                // Write the fault code to the console 
                Console.WriteLine(e.Code);

                // Write the fault message to the console 
                Console.WriteLine("An unexpected error has occurred: " + e.Message);

                // Write the stack trace to the console 
                Console.WriteLine(e.StackTrace);

                // Return False to indicate that the login was not successful 
                return false;
            }



            // Check if the password has expired 
            if (lr.passwordExpired)
            {
                Console.WriteLine("An error has occurred. Your password has expired.");
                return false;
            }


            /** Once the client application has logged in successfully, it will use
             * the results of the login call to reset the endpoint of the service
             * to the virtual server instance that is servicing your organization
             */
            // Save old authentication end point URL
            String authEndPoint = binding.Url;
            // Set returned service endpoint URL
            binding.Url = lr.serverUrl;

            /** The sample client application now has an instance of the SforceService
             * that is pointing to the correct endpoint. Next, the sample client
             * application sets a persistent SOAP header (to be included on all
             * subsequent calls that are made with SforceService) that contains the
             * valid sessionId for our login credentials. To do this, the sample
             * client application creates a new SessionHeader object and persist it to
             * the SforceService. Add the session ID returned from the login to the
             * session header
             */
            binding.SessionHeaderValue = new SessionHeader();
            binding.SessionHeaderValue.sessionId = lr.sessionId;

            //printUserInfo(lr, authEndPoint);

            // Return true to indicate that we are logged in, pointed  
            // at the right URL and have our security token in place.     
            return true;
        }
    }
}