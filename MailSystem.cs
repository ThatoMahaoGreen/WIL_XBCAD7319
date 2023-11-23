using System;
using System.Linq;
using System.Web;
using MailKit.Net.Smtp;
using MimeKit;
using System.Threading.Tasks;


namespace WIL
{
    public class MailSystem
    {
        public static Task<bool> SendPromotions(string fileName, HttpPostedFile httpf)
        {
            return Task.Run(async () =>
            {
                try
                {
                    foreach (var mail in DatabaseController.emails)
                    {
                        var e_mail = new MimeMessage();
                        var bb = new BodyBuilder();
                        e_mail.From.Add(new MailboxAddress("Vitastart Advertising", System.Configuration.ConfigurationManager.AppSettings["email"]));
                        e_mail.To.Add(new MailboxAddress("Vitastart Advertising", mail));
                        e_mail.Subject = "VitaStart Promotions";
                        bb.TextBody = @"Please view the attached document to view our new promotion!";
                        bb.Attachments.Add(fileName, httpf.InputStream);
                        e_mail.Body = bb.ToMessageBody();

                        using (var smtp = new SmtpClient())
                        {
                            await smtp.ConnectAsync("smtp.gmail.com", 587, false);

                            // Note: only needed if the SMTP server requires authentication
                            await smtp.AuthenticateAsync(System.Configuration.ConfigurationManager.AppSettings["email"], System.Configuration.ConfigurationManager.AppSettings["password"]);

                            await smtp.SendAsync(e_mail);
                            if (mail.Equals(DatabaseController.emails.Last()))
                            {
                                await smtp.DisconnectAsync(true);

                            }
                        }
                    }
                    return true;
                }catch (Exception)
                {
                    return false;
                }
            });
        }
        public static Task<bool> SendEmail(string name, string email, string message)
        {
            return Task.Run(async () =>
            {
                try
                {
                        var e_mail = new MimeMessage();
                        var bb = new BodyBuilder();
                        e_mail.From.Add(new MailboxAddress(name, email));
                        e_mail.To.Add(new MailboxAddress("Vitastart Advertising", System.Configuration.ConfigurationManager.AppSettings["email"]));
                        e_mail.Subject = "VitaStart Customer Contact";
                        bb.TextBody = @message;
                        e_mail.Body = bb.ToMessageBody();

                        using (var smtp = new SmtpClient())
                        {
                            await smtp.ConnectAsync("smtp.gmail.com", 587, false);

                            // Note: only needed if the SMTP server requires authentication
                            await smtp.AuthenticateAsync(System.Configuration.ConfigurationManager.AppSettings["email"], System.Configuration.ConfigurationManager.AppSettings["password"]);

                            await smtp.SendAsync(e_mail);
                           
                        }
          
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            });
        }

        public static Task<bool> ApplicationReply(string name, string email, string message)
        {
            return Task.Run(async () =>
            {
                try
                {
                    var e_mail = new MimeMessage();
                    var bb = new BodyBuilder();
                    e_mail.From.Add(new MailboxAddress("Vitastart Advertising", System.Configuration.ConfigurationManager.AppSettings["email"]));
                    e_mail.To.Add(new MailboxAddress(name, email));
                    e_mail.Subject = "Job Application at VitaStart.";
                    bb.TextBody = @message;
                    e_mail.Body = bb.ToMessageBody();

                    using (var smtp = new SmtpClient())
                    {
                        await smtp.ConnectAsync("smtp.gmail.com", 587, false);

                        // Note: only needed if the SMTP server requires authentication
                        await smtp.AuthenticateAsync(System.Configuration.ConfigurationManager.AppSettings["email"], System.Configuration.ConfigurationManager.AppSettings["password"]);

                        await smtp.SendAsync(e_mail);

                    }

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            });
        }
    }
}