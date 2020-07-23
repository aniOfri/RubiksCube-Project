using System;
using System.Data;

namespace RubiksCube_Masterpage
{
    public partial class Login : System.Web.UI.Page
    {
        public string LogStatus = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "db.mdf";
            string tableName = "personalData";

            if (Request["submit"] != null)
            {
                string username = Request["name"].Replace(" ", "");
                string password = Request["password"].Replace(" ", "");

                string selectQuery = "SELECT Password FROM " + tableName;
                selectQuery += " WHERE ";
                selectQuery += " Username ='" + username + "'";
                if (MyAdoHelper.IsExist(fileName, selectQuery))
                {
                    DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, selectQuery);
                    string pass = dt.Rows[0]["password"].ToString().Replace(" ", "");

                    if (pass == password)
                    {
                        LogStatus = "Logged in successfully";

                        Session["user"] = username;
                        Response.Redirect("Home.aspx");
                        Response.End();
                    }
                    else
                        LogStatus = "Either the username or the password are wrong in.";
                }
                else
                {
                    LogStatus = "Either the username or the password aren't right.";
                }
            }
        }
    }

}