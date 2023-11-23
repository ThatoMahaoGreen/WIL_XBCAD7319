using System;
using System.Web.UI;

namespace WIL
{

    public partial class Contact : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected async void UploadDetails(object sender, EventArgs e)
        {
            if (signupRadioButton.Checked)
            {
               await DatabaseController.AddCustomerEmail(emailTextBox.Text);
            }


        }
    }
}