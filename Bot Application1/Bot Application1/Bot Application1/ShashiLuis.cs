using CCSM.BusinessObjects;
using CCSM.DataAccess;
using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Builder.Luis;
using Microsoft.Bot.Builder.Luis.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Web;

namespace Bot_Application1
{
    [Serializable]
    [LuisModel("188f168a-49d9-4325-b6f7-c9fcbac1416d", "b35aaa9b9a574a6b8e9370898c34b46e")]
    public class ShashiLuis : LuisDialog<Object>
    {
        UserInputData userData = new UserInputData();
        [LuisIntent("Trainings")]
        public async Task Trainings(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("Let me look at the training options...");
            IEnumerable<string> m_oEnum = new string[] { "Beginner Level", "Intermediate Level", "Expert Level" };
            PromptDialog.Choice(context, DisplayTrainings, m_oEnum, "Please select the Training Level", "Try selecting a different Training Level", 3, PromptStyle.Auto);

        }

        [LuisIntent("Hi")]
        public async Task Hi(IDialogContext context, LuisResult result)
        {
            string msg1 = "Hello {0} !" + "\r\nWelcome to {1}, I'm your VirtualAssistance and here to get you started.";
            DataAccess da = getDA();
            CUser user = da.getUserByEmail("bryan.plaster@gmail.com");
            await context.PostAsync(string.Format(msg1, user.Username, user.Company.CompanyName));
            context.Wait(MessageReceived);
        }

        [LuisIntent("WelcomeOptions")]
        public async Task WelcomeOptions(IDialogContext context, LuisResult result)
        {
            DataAccess da = getDA();
            await context.PostAsync("Well, I can do many things. But here are few things which I can help you with...");
            IEnumerable<string> wOptions = new string[] { "Confirm Your Subscription", "Register For Tech Support", "Trainings", "Ask A Support Question", "Meet With An Expert" };
            
            PromptDialog.Choice(context, WelcomeOptionSelection, wOptions, "Please select an option you are interested in...", "You may want to try something else..", 3, PromptStyle.Auto);

        }

        private async Task WelcomeOptionSelection(IDialogContext context, IAwaitable<string> result)
        {
            EntityRecommendation er = new EntityRecommendation();
            er.Entity = await result;
            var entities = new List<EntityRecommendation>();
            //entities.Add(new EntityRecommendation(type: "MeetExpert") { Entity = er.Entity });

            IntentRecommendation ir = new IntentRecommendation();
            ir.Intent = await result;
            var intents = new List<IntentRecommendation>();
        //    intents.Add(new IntentRecommendation(intent: "MeetExpert") { Intent = er.Entity });

            LuisResult lr = new LuisResult(await result, intents,entities);
            

            switch (await result)
            {
                case "Confirm Your Subscription":
                    await context.PostAsync("!!! Coming soon... !!!");
                    context.Wait(MessageReceived);
                    break;
                case "Register For Tech Support":
                    await RegisterForTechSupport(context, lr);
                    break;
                case "Trainings":
                    await Trainings(context, lr);
                    break;
                case "Ask A Support Question":
                    await SupportQuestion(context, lr);
                    break;
                case "Meet With An Expert":
                    await MeetExpert(context, lr);
                    break;
                default:
                    await None(context, lr);
                    break;
            }
        }

        [LuisIntent("MeetExpert")]
        public async Task MeetExpert(IDialogContext context, LuisResult result)
        {
            DataAccess da = getDA();
            await context.PostAsync("Sure, I need some more details...");
            ExpertTimeSlot[] timeSlots = da.getExpertTimeSlots();
            List<string> timeSlotNames = new List<string>();
            foreach (ExpertTimeSlot slot in timeSlots)
            {
                if(slot.ExpSlotType != null)
                    timeSlotNames.Add(slot.ExpSlotType);
            }
            var unique_set = new HashSet<string>(timeSlotNames.ToArray());
            PromptDialog.Choice(context, ExpertSlotSelection, unique_set, "Please select the type of expert support you are looking for..", "Try selecting a different type", 3, PromptStyle.Auto);

        }

        private async Task ExpertSlotSelection(IDialogContext context, IAwaitable<string> result)
        {
            await context.PostAsync("Digging for expert's available slots...");
            DataAccess da = getDA();
            ExpertTimeSlot[] timeSlots = da.getExpertTimeSlots();
            List<string> availableSlots = new List<string>();
            foreach (ExpertTimeSlot slot in timeSlots)
            {
                availableSlots.Add(slot.ExpSlotDate.ToLongDateString());
            }
            PromptDialog.Choice(context, ConfirmExpertSlot, availableSlots.ToArray(), "Please select the slot suitable for you..", "Try selecting a different slot", 3, PromptStyle.Auto);
        }

        private async Task ConfirmExpertSlot(IDialogContext context, IAwaitable<string> result)
        {
            PromptDialog.Confirm(context, ExpertSlotUserResponse, "Confirmation: Are you sure you want to book slot for " + await result + " time ?", promptStyle: PromptStyle.None);
        }

        private async Task ExpertSlotUserResponse(IDialogContext context, IAwaitable<bool> result)
        {
            if (await result)
            {
                await context.PostAsync("Slot booked!");
            }
            else
            {
                await context.PostAsync("Not booked!");
            }
            context.Wait(MessageReceived);
        }

        [LuisIntent("SupportQuestion")]
        public async Task SupportQuestion(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("Okay, Let me see if I can help with that!");
            await context.PostAsync("!!! --- Yet to implement --- !!!");
            context.Wait(MessageReceived);
        }

        [LuisIntent("RegisterForTechSupport")]
        public async Task RegisterForTechSupport(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("I need some more details in order to get you registered for tech support...");
            await context.PostAsync("!!! --- Yet to implement --- !!!");
            context.Wait(MessageReceived);
        }

        [LuisIntent("None")]
        [LuisIntent("")]
        public async Task None(IDialogContext context, LuisResult result)
        {
            var dialog = new GreetingsDialog();
            dialog.InitialMessage = result.Query;
            await context.PostAsync("Didn't get that!");
            context.Wait(MessageReceived);
        }

        private async Task DisplayTrainings(IDialogContext context, IAwaitable<string> result)
        {
            string level = await result;
            level = level == "Expert Level" ? "Expert" : level == "Intermediate Level" ? "Intermediate" : "Beginner";
            userData.trainingLevel = level;
            await context.PostAsync("These are the available trainings for " + level + " level: .. .. ..");
            PromptDialog.Choice(context, TrainingModes, GetListOfTrainings(level), "Please select the Training", "Try selecting a different Training", 3, PromptStyle.Auto);
            
        }

        private async Task TrainingModes(IDialogContext context, IAwaitable<string> result)
        {
            userData.training = await result;

            IEnumerable<string> m_oEnum = new string[] { "On Demand", "Instructor Led" };
            PromptDialog.Choice<string>(context, ShowAvailableSlots, m_oEnum, "Please select the mode of training", "Try selecting a different mode", 3, PromptStyle.Auto);
            
        }

        private async Task ShowAvailableSlots(IDialogContext context, IAwaitable<string> result)
        {
            string trainingType = await result;
            string[] sArr1 = GetSlotsForTrainings(userData.trainingLevel, userData.training, trainingType);
            await context.PostAsync("Available slots for " + userData.trainingLevel + " level & " + userData.training + " training & " + trainingType + " Mode " + " are: " + string.Join(" ",sArr1));
       //     await PromptDialog.Confirm(context, Trainings, "You already have a suscription, so would you like to add additional products or renew early?   please approve with YES", promptStyle: PromptStyle.None);
            context.Wait(MessageReceived);
        }

       // private Task Trainings(IDialogContext context, IAwaitable<bool> result)
    //    {
     //       context.Call();
     //   }

        private IEnumerable<string> GetListOfTrainings(string sLevel)
        {
            List<string> sReturnLst = new List<string>();
            string path = AppDomain.CurrentDomain.BaseDirectory + "/conf/Courses.csv";
            var fileLines = System.IO.File.ReadAllLines(path);
            foreach (var singleLine in fileLines)
            {
                if (singleLine != null)
                {
                    string[] sArr = singleLine.Split(',');
                    if(sArr.Length > 0 && sLevel == sArr[0])
                    {
                        sReturnLst.Add(sArr[1]);
                    }
                }
                
            }
            return sReturnLst.ToArray();
        }

        private string[] GetSlotsForTrainings(string sLevel, string trainingName, string type)
        {
            int index = type == "On Demand" ? 2 : 3;
            List<string> sReturnLst = new List<string>();
            string path = AppDomain.CurrentDomain.BaseDirectory + "/conf/Courses.csv";
            var fileLines = System.IO.File.ReadAllLines(path);
            foreach (var singleLine in fileLines)
            {
                if (singleLine != null)
                {
                    string[] sArr = singleLine.Split(',');
                    if (sArr.Length > (index-1) && sLevel == sArr[0] && trainingName == sArr[1])
                    {
                        string[] sSlots = sArr[index].Split('|');
                        sReturnLst.AddRange(sSlots);
                        break;
                    }
                }

            }
            return sReturnLst.ToArray();
        }

        //helper
        private DataAccess getDA()
        {
            GenericCompany company = new GenericCompany("12345");//load default company
            CUser user = new CUser(company, "bryan.plaster@gmail.com");
            DataAccess da = new DataAccess(company, user);
            return da;
        }

        [Serializable]
        private class UserInputData
        {
            public string trainingLevel { get; set; }
            public string training { get; set; }
        }


    }
}