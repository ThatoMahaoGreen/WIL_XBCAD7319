using Org.BouncyCastle.Utilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WIL
{
    public partial class AdminMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected async void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string Name;
            string email;
            string message;
            string fileName;
            

            if (e.CommandName == "Accept")
            {
                message = "Congratulations, we reviewed your CV and we have decided to accept your application for a job. Please contact us on this email to confirm your interest.";
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = detailsGridView.Rows[rowIndex];

                Name = row.Cells[0].Text;
                email = row.Cells[1].Text;

                await MailSystem.ApplicationReply(Name, email, message);
            }
            else if (e.CommandName == "Reject")
            {
                message = "Hello, we reviewed your CV and sadly, we have decided to reject your application for a job. Please contact us on this email if you have any further questions";
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = detailsGridView.Rows[rowIndex];

                Name = row.Cells[0].Text;
                email = row.Cells[1].Text;

               await MailSystem.ApplicationReply(Name, email, message);
            }
            else if(e.CommandName == "Download")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = detailsGridView.Rows[rowIndex];

                Name = row.Cells[0].Text;
                email = row.Cells[1].Text;
                fileName = row.Cells[2].Text;

                if (await DatabaseController.GetApplicationID(Name, email))
                {
                    if (await DatabaseController.GetFile())
                    {
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.ContentType = DatabaseController.contentType;
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                        Response.BinaryWrite(DatabaseController.file);
                        Response.Flush();
                        Response.End();
                    }
                }
       
            }

        }


    }
}