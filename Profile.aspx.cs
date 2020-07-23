using System;
using System.Data;

namespace RubiksCube_Masterpage
{
    public partial class Profile : System.Web.UI.Page
    {
        public string chngPassStatus = "";
        public string profileInfo = "";
        public string color = "color: #50c888;";

        string fileName = "db.mdf";
        string tableName = "personalData";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
                Response.End();
            }

            if (Session["showinf"] != null)
            {
                profileInfo = Session["showinf"].ToString();
                Session["showinf"] = null;
            }


            if (Session["user"].ToString() == "Manager")
                color = "color: #f5316f;";

            if (Request["submit"] != null)
            {
                // Get form inputs
                string username = Session["user"].ToString();
                string curpass = Request["curpass"].Replace(" ", "");
                string newpass = Request["password"].Replace(" ", "");

                // Get current password from database
                string selectQuery = "SELECT Password FROM " + tableName;
                selectQuery += " WHERE ";
                selectQuery += " Username ='" + username + "'";

                DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, selectQuery);
                string pass = dt.Rows[0]["password"].ToString().Replace(" ", "");

                // Verify current password
                if (curpass == pass)
                {
                    // Update password on database
                    string replaceQuery = "UPDATE " + tableName + " SET Password='" + newpass + "'";
                    replaceQuery += "WHERE Username='" + username + "'";

                    MyAdoHelper.DoQuery(fileName, replaceQuery);

                    chngPassStatus = "New password updated successfully";
                }
                else
                {
                    chngPassStatus = "Current password is incorrect.";
                }
            }
        }
        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string sqlStr = "SELECT * FROM " + tableName;
            sqlStr += " WHERE Username='" + Session["user"].ToString() + "'";
            Session["showinf"] = MyAdoHelper.printDataTable(fileName, sqlStr).ToString();

            Response.Redirect("Profile.aspx");
        }
    }
}
