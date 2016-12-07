using BestMatchDialog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Connector;
using System.Threading.Tasks;

namespace Bot_Application1
{
    [Serializable]
    public class GreetingsDialog : BestMatchDialog<object>
    {
        [BestMatch(new string[] { "Hi", "Hi There", "Hello there", "Hey", "Hello",
            "Hey there", "Greetings", "Good morning", "Good afternoon", "Good evening", "Good day" },
                    threshold: 0.5, ignoreCase: false, ignoreNonAlphaNumericCharacters: false)]
        public async Task HandleGreeting(IDialogContext context, string messageText)
        {
            await context.PostAsync("Well hello there. What can I do for you today?");
            //context.Wait(MessageReceived);
            context.Done(true);
        }

        [BestMatch(new string[] { "bye", "bye bye", "got to go",
            "see you later", "laters", "adios" })]
        public async Task HandleGoodbye(IDialogContext context, string messageText)
        {
            await context.PostAsync("Bye. Looking forward to our next awesome conversation already.");
            //context.Wait(MessageReceived);
            context.Done(true);
        }

        public override async Task NoMatchHandler(IDialogContext context, string messageText)
        {
            await context.PostAsync("I’m not sure what you want.");
            //context.Wait(MessageReceived);
            context.Done(false);
        }
    }
}