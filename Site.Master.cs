using System;

namespace RubiksCube_Masterpage
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string background = "";
        public string display = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                loginLink.HRef = "Profile.aspx";
                loginLink.InnerHtml = "Profile";
                abandLink.Style["display"] = "inner-block";

                string sessionUsername = Session["user"].ToString() ;
                if (sessionUsername == "Manager")
                {
                    heading.Style["background"] = "#f5316f";
                    background = "background: linear-gradient(to right, #f5316f 50%, #f0004c 50%);";
                    mangLink.Style["display"] = "inline-block";
                }
            }
        }
    }
}