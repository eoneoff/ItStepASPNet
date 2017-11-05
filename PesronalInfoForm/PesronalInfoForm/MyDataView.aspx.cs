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
            if(!String.IsNullOrEmpty(Cache["FamilyName"] as string))
                FamilyNameLabel.Text = Cache["FamilyName"] as string;

            if(!String.IsNullOrEmpty(Cache ["FirstName"] as string))
                FirstNameLabel.Text = Cache["FirstName"] as string;

            if(!String.IsNullOrEmpty(Cache["Patronim"] as string))
                PatronimLabel.Text = Cache["Patronim"] as string;

            if (Cache["Sex"] != null)
                SexLabel.Text = Cache["Sex"] as string;

            if (Cache["City"] != null)
                CityLabel.Text = Cache["City"] as string;
            
            if(Cache["Hobbies"]!=null)
                HobbyLabel.Text = Cache["Hobbies"] as string;

            if (Cache["BirthDate"] != null)
                BirthDayLabel.Text = Cache["BirthDate"] as string;
        }
    }
}