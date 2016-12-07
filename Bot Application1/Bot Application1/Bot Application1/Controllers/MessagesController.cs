using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Microsoft.Bot.Connector;
using Newtonsoft.Json;
using System.Collections.Generic;
using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Builder.Luis;
using Microsoft.Bot.Builder.Luis.Models;
using BestMatchDialog;
using System.Threading;

namespace Bot_Application1
{
    [BotAuthentication]
    public class MessagesController : ApiController
    {
        /// <summary>
        /// POST: api/Messages
        /// Receive a message from a user and reply to it
        /// app id password:  CompleteCSMBot1    LSEUTbPEywqVJmhkbd8MLdG
        /// app id fca3183a-d011-4796-9a78-13a5ff0f3e93 
        /// 
        /// slack  client id 101442615492.101456898597
        /// slack client secret  951b1c104c312d9ab9754d6948047598
        /// 
        /// twillio appid  AC9f4a95ba99ffcbada7f87263cdde21b3
        /// twilios token 11fc12f271fb5689db5baf8baa01bf2b
        /// twilio phone  (469) 617-2019
        /// </summary>
        public async Task<HttpResponseMessage> Post([FromBody]Activity activity)
        {
            // check if activity is of type message
            // if (activity != null && activity.GetActivityType() == ActivityTypes.Message)
            if (activity.Type == ActivityTypes.Message)
            {
                
                await Conversation.SendAsync(activity, () => new EchoDialog());               
                //await Conversation.SendAsync(activity, () => new LUISModel());


                //decide with CASe - is this a form selection of 1 - 5 
                //or is this a Luis request that we need to do?  
                

            }
            else
            {
                HandleSystemMessage(activity);
            }
            return new HttpResponseMessage(System.Net.HttpStatusCode.Accepted);

          
        }
       
        private Activity HandleSystemMessage(Activity message)
        {

            if (message.Type == ActivityTypes.DeleteUserData)
            {
                // Implement user deletion here
                // If we handle user deletion, return a real message
            }
            else if (message.Type == ActivityTypes.ConversationUpdate)
            {
                // Handle conversation state changes, like members being added and removed
                // Use Activity.MembersAdded and Activity.MembersRemoved and Activity.Action for info
                // Not available in all channels
               
                    string replyMessage = string.Empty;
                    replyMessage += $"Hi there\n\n";
                    replyMessage += $"I am MeBot. Designed to answer questions about this blog.  \n";
                    replyMessage += $"Currently I have following features  \n";
                    replyMessage += $"I will get more intelligent in future.";

                    return message.CreateReply(replyMessage);
                
            }
            else if (message.Type == ActivityTypes.ContactRelationUpdate)
            {
                // Handle add/remove from contact lists
                // Activity.From + Activity.Action represent what happened
            }
            else if (message.Type == ActivityTypes.Typing)
            {
                // Handle knowing tha the user is typing
            }
            else if (message.Type == ActivityTypes.Ping)
            {
            }

            return null;
        }

       

        [Serializable]
        public class EchoDialog : IDialog<object>
        {
            protected int count = 1;
            public async Task StartAsync(IDialogContext context)
            {
                context.Wait(MessageReceivedAsync);
            }
            public virtual async Task MessageReceivedAsync(IDialogContext context, IAwaitable<IMessageActivity> argument)
            {
                var message = await argument;
                if (message.Text == "reset")
                {
                    PromptDialog.Confirm(
                        context,
                        AfterResetAsync,
                        "Are you sure you want to reset the count?",
                        "Didn't get that!",
                        promptStyle: PromptStyle.None);
                }
                else
                {
                    await context.PostAsync($"{this.count++}: You said {message.Text}");
                    context.Wait(MessageReceivedAsync);
                }
            }
            public async Task AfterResetAsync(IDialogContext context, IAwaitable<bool> argument)
            {
                var confirm = await argument;
                if (confirm)
                {
                    this.count = 1;
                    await context.PostAsync("Reset count.");
                }
                else
                {
                    await context.PostAsync("Did not reset count.");
                }
                context.Wait(MessageReceivedAsync);
            }
        }





        private Attachment addMultimedia()
        {
            //message.Attachments.Add()
            List<CardImage> cardImages = new List<CardImage>();
            cardImages.Add(new CardImage(url: "http://yourcsm.com/wp-content/uploads/2016/09/completecsmlogo5orangeblue.png"));


            List<CardAction> cardButtons = new List<CardAction>();
            CardAction plButton = new CardAction()
            {
                Value = "https://en.wikipedia.org/wiki/Pig_Latin",
                Type = "openUrl",
                Title = "WikiPedia Page"
            };
            cardButtons.Add(plButton);


            HeroCard plCard = new HeroCard()
            {
                Title = "I'm a hero card",
                Subtitle = "Pig Latin Wikipedia Page",

                //add the image and buttons
                Images = cardImages,
                Buttons = cardButtons
            };

            //create attachment
            Attachment plAttachment = plCard.ToAttachment();


            return plAttachment;
        }

        ReceiptItem lineItem1 = new ReceiptItem()
        {
            Title = "Pork Shoulder",
            Subtitle = "8 lbs",
            Text = null,
            Image = new CardImage(url: "https://<ImageUrl1>"),
            Price = "16.25",
            Quantity = "1",
            Tap = null
        };


       
    }
}


/*
               var entitiesArray = result.Entities;
               var reply = context.MakeMessage();
               foreach (var entityItem in result.Entities)
               {
                   if (entityItem.Type == "Character")
                   {

                       switch (entityItem.Entity)
                       {
                           case "raven":
                               reply.Text = "Raven the Best";
                               reply.Attachments = new List<Attachment>();
                               reply.Attachments.Add(new Attachment
                               {
                                   Title = "Name: Raven Reyes",
                                   ContentType = "image/jpeg",
                                   ContentUrl = "URL_PIC_LINK",
                                   Text = "It won't survive me"
                               });
                               break;
                           case "clarke":
                               reply.Text = "Clarke is the main character";
                               break;
                           default:
                               reply.Text = "I don't know this character";
                               break;
                       }
                       await context.PostAsync(reply);
                       context.Wait(MessageReceived);
                   }
               }*/
