using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PesronalInfoForm
{
    public partial class MyData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            if(FamilyNameTextBox.Text!=string.Empty)
                Session["FamilyName"] = FamilyNameTextBox.Text;
            if(FirstNameTextBox.Text!=string.Empty)
                Session["FirstName"] = FirstNameTextBox.Text;
            if(PatronimTextBox.Text!=string.Empty)
                Session["Patronim"] = PatronimTextBox.Text;
            if (MaleRadioButton.Checked)
                Session["Sex"] = "мужской";
            else if (FemaleRadioButton.Checked)
                Session["Sex"] = "женский";

            Response.Redirect("MyDataView.aspx");
        }
    }
}