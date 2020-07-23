using System;

namespace RubiksCube_Masterpage
{
    public partial class Home : System.Web.UI.Page
    {
        protected string username = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
                username = "Hello, " + Session["user"].ToString();

        }
    }
}