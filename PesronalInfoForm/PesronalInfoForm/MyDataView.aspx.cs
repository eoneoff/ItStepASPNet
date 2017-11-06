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
            GetFromSession(FamilyNameLabel, "FamilyName");

            GetFromSession(FirstNameLabel, "FirstName");

            GetFromSession(PatronimLabel, "Patronim");

            GetFromSession(SexLabel, "Sex");

            GetFromSession(CityLabel, "City");

            GetFromSession(HobbyLabel, "Hobby");

            GetFromSession(BirthDayLabel, "BirthDate");
        }

        private void GetFromSession(Label label, string property)
        {
            if(Session[property]!=null)
            {
                string value = Session[property] as string;
                Session[property] = null;
                if(value!=String.Empty)
                {
                    label.Text = value;
                }
            }

        }
    }
}