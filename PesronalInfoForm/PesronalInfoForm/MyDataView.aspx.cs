using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PesronalInfoForm
{
    public partial class MyDataView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Form["FamilyName"]!=String.Empty)
                FamilyNameLabel.Text = Request.Form["FamilyName"];
            if(Request.Form["FirstName"]!=String.Empty)
                FirstNameLabel.Text = Request.Form["FirstName"];
            if(Request.Form["Patronim"]!=String.Empty)
                PatronimLabel.Text = Request.Form["Patronim"];
            if(Request.Form["Sex"]!=null)
            {
                if (Request.Form["Sex"] == "male")
                    SexLabel.Text = "Мужской";
                else
                    SexLabel.Text = "Женский";
            }
        }
    }
}