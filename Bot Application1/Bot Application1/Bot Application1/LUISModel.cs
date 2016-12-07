using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Builder.Luis;
using Microsoft.Bot.Builder.Luis.Models;
using System;
using System.Threading.Tasks;
using CCSM.BusinessObjects;
using CCSM.DataAccess;
using Newtonsoft.Json;

namespace Bot_Application1
{
        [Serializable]
        [LuisModel("e8a36f11-ab42-4e77-8e88-3a94a9d21363", "b3d8cfd6e9ce4468b46a2d8b6e8288a8")]
        public class LUISModel : LuisDialog<Object>
        {

        //helper
        private DataAccess getDA()
        {
            GenericCompany company = new GenericCompany("12345");//load default company
            CUser user = new CUser(company, "bryan.plaster@gmail.com");
            DataAccess da = new DataAccess(company, user);
            return da;
        }


        //figure out the current subscription date and add a year
            [LuisIntent("RenewSubsc")]
            public async Task RenewSubsc(IDialogContext context, LuisResult result)
            {

            DataAccess da = getDA();
            //get subsc
            Subscription subsc = da.getSubscription();
            //add a year to recommend
            DateTime nextyear = subsc.SubscEnd.AddYears(1);

            PromptDialog.Confirm(context, CreateRenewSubscRequest, "I will request your renewal for another year until " + nextyear.ToString() + ", please approve with YES", promptStyle: PromptStyle.None);
            //await context.PostAsync("I'm sorry. I didn't understand you. RenewSubsc");


            // result.Intents[0].Actions[0].Parameters[0].Required;
            //JsonConvert.DeserializeObject<LUISResponse>(await response.Content.ReadAsStringAsync());


           // context.Wait(MessageReceived);
            }

        public async Task CreateRenewSubscRequest(IDialogContext context, IAwaitable<bool> confirmation)
        {
            if (await confirmation)
            {
               //create a ticket to renew subscription
                await context.PostAsync("Your Subscription has been renewed!");
            }
            else
            {
                await context.PostAsync("Ok! we won't renew at this time");
            }
            context.Wait(MessageReceived);
        }


        //get the details of the subscription
        [LuisIntent("GetSubscDetails")]
            public async Task GetSubscDetails(IDialogContext context, LuisResult result)
            {

            DataAccess da = getDA();
            Subscription subsc = da.getSubscription();
            string reply = subsc.ToString();


            await context.PostAsync("GetSubscDetails" + reply);
                context.Wait(MessageReceived);
            }



        
        [LuisIntent("SearchTrainingModules")]
        public async Task SearchTrainingModules(IDialogContext context, LuisResult result)
        {
            DataAccess da = getDA();
            TrainingLink[] tl = da.getUserSearchedTrainingLinks(new string[] { "netsuite", "sap" });
            string reply = tl.ToString();


            await context.PostAsync("SearchTrainingModules" + reply);
            context.Wait(MessageReceived);
        }

        [LuisIntent("LookForIntroTraining")]
        public async Task LookForIntroTraining(IDialogContext context, LuisResult result)
        {
            DataAccess da = getDA();
            TrainingLink[] tl = da.getInitialTrainingLinks();
            string reply = tl.ToString();


            await context.PostAsync("LookForIntroTraining" + reply);
            context.Wait(MessageReceived);
        }

        [LuisIntent("CreateSubsc")]
        public async Task CreateSubsc(IDialogContext context, LuisResult result)
        {
            DataAccess da = getDA();
            //get subsc
            Subscription subsc = null; da.getSubscription();
            if (subsc == null)
            {
                //they don't have a subscription, verify to create one
                PromptDialog.Confirm(context, CreateSubscRequest, "Ok!  Confirm that you would like to create a subscription from your trial?", promptStyle: PromptStyle.None);
                //then this needs to go into a form to collect thier name, address, phone, and more
            }
            else
            {
                //they already have a subsription, let's figure out what they want to add. 
                // PromptDialog.PromptChoice(context, CreateSubscRequest, "Ok, let's create a subscription, what products would you like to add?", promptStyle: PromptStyle.None);
                PromptDialog.Confirm(context, CreateRenewSubscRequest, "You already have a suscription, so would you like to add additional products or renew early?   please approve with YES", promptStyle: PromptStyle.None);

            }

            //await context.PostAsync("CreateSubsc");
            // context.Wait(MessageReceived);
        }
        public async Task CreateSubscRequest(IDialogContext context, IAwaitable<bool> confirmation)
        {
            if (await confirmation)
            {
                //create a ticket to renew subscription
                //sf access create a ticket . . . .
                await context.PostAsync("Your Subscription will be created!");
                //
            }
            else
            {
                await context.PostAsync("Ok! we won't subscribe you at this time");
            }
            context.Wait(MessageReceived);
        }





        //we need to figure out what they want to add
        [LuisIntent("AddToSubsc")]
        public async Task AddToSubsc(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("I'm sorry. I didn't understand you. AddToSubsc");
            context.Wait(MessageReceived);
        }

        //can't understand, is it a HI or Bye?  or something else?
        [LuisIntent("None")]
        [LuisIntent("")]
        public async Task None(IDialogContext context, LuisResult result)
        {
            var dialog = new GreetingsDialog();
            dialog.InitialMessage = result.Query;
            context.Call(dialog, AfterCommonResponseHandled);
        }

        private async Task AfterCommonResponseHandled(IDialogContext context, IAwaitable<object> result)
        {
            var messageHandled = await result;
            bool mH = (bool)messageHandled;

            if (!mH)
            {
                await context.PostAsync("I’m not sure what you want");
            }

            context.Wait(MessageReceived);
        }
    }
}



/*
 * PromptDialog.Choice(context,
                        _ResolveMemberResult,
                        members.Select(s => $"{s.FirstName} {s.LastName}"),
                        "Which one?");
            }
        }

private async Task _ResolveMemberResult(IDialogContext context, IAwaitable<string> memberId)
        {
            await memberId;

            await context.PostAsync("Member found!");

            context.Wait(MessageReceived);
        }


    */