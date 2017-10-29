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
            if(Session["FamilyName"]!=null)
                FamilyNameLabel.Text = Session["FamilyName"] as string;
            if(Session["FirstName"]!=null)
                FirstNameLabel.Text = Session["FirstName"] as string;
            if(Session["Patronim"]!=null)
                PatronimLabel.Text = Session["Patronim"] as string;
            if(Session["Sex"]!=null)
                SexLabel.Text = Session["Sex"] as string;
        }
    }
}