using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CCSM.BusinessObjects;


/// <summary>
/// Summary description for DataAccess
/// </summary>
namespace CCSM.DataAccess
{
    public class DataAccess
    {
        private DataAccess()
        {
            //always create DataAccess with a company in mind, and sometimes a user
        }

        /****************************************************************************************************************************
         * Constructors
         * *************************************************************************************************************************/
        private BaseCompany company;
        private CUser user;
        private DatabaseUtils db = new DatabaseUtils();

        public DataAccess(BaseCompany company)
        {
            //always create DataAccess with a company in mind  
            this.company = getCompanyInfo(company);
        }
        //access the data by company and user
        public DataAccess(BaseCompany company, CUser user)
        {
            //always create DataAccess with a company in mind
            this.company = getCompanyInfo(company);
            this.user = getUserInfo(user);
        }

        //get info for constructor
        //need an id to play
        //private so that it is internal to this constructor
        private BaseCompany getCompanyInfo(BaseCompany company)
        {
            if (String.IsNullOrEmpty(company.CompanyGUID))
            {
                throw new Exception("Company GUID cannot be null, we need a GUID!");
            }

            return db.getCompanyByGUID(company);
        }

        //need an id to play
        //private so that it is internal to this constructor
        private CUser getUserInfo(CUser user)
        {
            if (user.UserId != 0)
                return db.getUserById(user);
            else
                return db.getUserByEmail(user);

        }


        /* what to impletement the ************************************************************************************************
         * Step 1: Confirm Subscription
         * 
         *  for Onboarding
         * *************************************************************************************************************************/

        //get the user by the email that they tell use
        public CUser getUserByEmail(string email)
        {
            if (user == null)
                user = new CUser(company, email);

            return db.getUserByEmail(user);
        }

        //get user by an ID that they tell us
        public CUser getUserById(int id)
        {
            if (user == null)
                user = new CUser(company, id);

            return db.getUserById(user);
        }
        public Subscription getSubscription()
        {
            if (user == null) throw new Exception("Need a user to find the subscription");

            return db.getSubscription(user);

            /*Subscription subs = new Subscription(user);
            //now fake datbaseUtils
            subs.SubscStart = DateTime.Now;
            subs.SubscEnd = DateTime.Now.AddYears(1);
            subs.SubscrProductMsg = "10 users of Bricks license";
            subs.CurrentStage = "Adoption";
            return subs;
            */
        }


        //lookup subscr from Salesforce
        public Subscription getSubscriptionFromSF(string accountId)
        {
            //for now return fake info
            return getSubscription();

            //SalesforceUtils sf = new SalesforceUtils(company);
            //return sf.lookUpSubscription(accountId, new Subscription(this.user));
        }

        public string createCaseForNoSubsc()
        {
            if (user == null) throw new Exception("Need a user and/or email to create a case");
            //put this in chat logic
            //"A case was created for you of number 434SRFS.  A Service Rep will "
            return "Service Case ID: LJLDFD335";
        }
        public string createCTAForNoSubsc()
        {
            if (user == null) throw new Exception("Need a user and/or email to create a CTA");
            //put this in chat logic
            //"A Customer Success Manager will reach back out to you shortly.";
            return "Customer Success ID: LKJDF444";
        }

        /* what to impletement the *************************************************************************************************
         * Step 2: Register for Tech Support
         * 
         *  for Onboarding
         * *************************************************************************************************************************/

        public string createCaseForAddingSupportUsers(String userinput)
        {
            if (user == null) throw new Exception("Need a user email to create a case");

            SalesforceUtils su = new SalesforceUtils(company);
            return su.createCase("VCSM: Please enlist users in support", userinput, user);            
        }
        public string createCaseForUser(String userinput)
        {
            if (user == null) throw new Exception("Need a user email to create a case");

            SalesforceUtils su = new SalesforceUtils(company);
            return su.createCase("VCSM: User requested a case", userinput, user);
        }
        public string createCTAForAddingSupportUsers(String userinput)
        {
            if (user == null) throw new Exception("Need a user and/or email to create a CTA");

            SalesforceUtils su = new SalesforceUtils(company);
            return su.createCase("VCSM: User requested a CSM", userinput, user);
        }
        public string getLinkToSupportSignup()
        {
            if (company.Intgr == null)
                throw new Exception("Integrations are not configured yet!");
            else
                return company.Intgr.SupportSignupLink;           
        }

        /* what to impletement the *************************************************************************************************
     * Step 3: Recommend Training
     * 
     *  for Onboarding
     * *************************************************************************************************************************/

        public TrainingLink[] getInitialTrainingLinks()
        {
            return db.getInitialTrainingLinks(company);
        }

        //send in Keywords using the token of ,
        public TrainingLink[] getUserSearchedTrainingLinks(string[] keywordsByToken)
        {
            return db.getUserSearchedTrainingLinks(company, keywordsByToken);
        }

        /* what to impletement the *************************************************************************************************
      * Step 4: Ask a support question
      * 
      *  for Onboarding
      * *************************************************************************************************************************/

                   

        //send in Keywords using the token of ;
        //search knowledge base
        public SupportLink[] searchFromTop10Issues(string[] keywordsByToken)
        {
            return db.getUserSearchedSupportLinks(company, keywordsByToken);
        }

        public SupportLink[] searchFromKB(string keywordsByToken)
        {
            //this one should search from Salesforce Knowledge ARticles
            return null; // db.getUserSearchedSupportLinks(company, keywordsByToken);
        }

        /* what to implement the **********************************************************************************************
    * Step 5: Ask an Expert
    * 
    *  for Onboarding
    * *************************************************************************************************************************/

        //get the service offerings to pick from
        public ServiceOffLink[] getServiceOfferings()
        {
            return db.getServiceOfferings(company);
        }
        //send in Keywords using the token of ,
        public ServiceOffLink[] getUserSearchedServiceOffLink(string[] keywordsByToken)
        {
            return db.getUserSearchedServiceOffLink(company, keywordsByToken);
        }

        //get the expert timeslots from the database that they can sign up for
        public ExpertTimeSlot[] getExpertTimeSlots()
        {
            return db.getExpertTimeSlots(company);
        }
        public ExpertTimeSlot[] getUserSearchedExpertSlot(string[] keywordsByToken)
        {
            return db.getUserSearchedExpertSlot(company, keywordsByToken);
        }


        //create a case to assign the slot
        public string createCaseForAssigningExpertSlot(ExpertTimeSlot slot)
        {
            if (user == null) throw new Exception("Need a user and/or email to create a case");
            //put this in chat logic
            //"A case was created for us to add . . ..  A Service Rep will "
            return "Service Case ID: DDDDFD999";
        }

        //create a CTA to assign an expert slot
        public string createCTAForAssigningExpertSlot(ExpertTimeSlot slot)
        {
            if (user == null) throw new Exception("Need a user and/or email to create a CTA");
            //put this in chat logic
            //"A case was created for us to add . . ..  A Service Rep will "
            return "Customer Success ID: NBBDF8888";
        }







    }

}