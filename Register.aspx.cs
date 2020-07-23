using System;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace RubiksCube_Masterpage
{
    public partial class Register : System.Web.UI.Page
    {
        public string RegStatus = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "db.mdf";
            string tableName = "personalData";

            if (Session["status"] != null)
            {
                RegStatus = Session["status"].ToString();
                if (RegStatus == "SUCC")
                    RegStatus = "Successfully registered.";
                else
                    RegStatus = "Either the email or username already in use.";
            }

            if (Request["submit"] != null)
            {
                string username = Request["name"].Replace(" ", "");
                string email = Request["email"].Replace(" ", "");
                string password = Request["password"].Replace(" ", "");
                string favcube = Request["favCube"];

                string selectQuery = "SELECT * FROM " + tableName;
                selectQuery += " WHERE ";
                string selectQueryEmail = selectQuery + " Email ='" + email + "'";
                string selectQueryUsername = selectQuery + " Email ='" + username + "'";
                if (MyAdoHelper.IsExist(fileName, selectQueryEmail) || MyAdoHelper.IsExist(fileName, selectQueryUsername))
                {
                    Session["status"] = "FAIL";
                    Response.Redirect("Register.aspx");
                }
                else
                {
                    string sql = "INSERT INTO personalData (Username, Email, Password, Favcube) VALUES (\'";
                    sql += username + "\', \'" + email + "\', \'" + password + "\', \'" + favcube + "\')";
                    MyAdoHelper.DoQuery(fileName, sql);

                    Session["status"] = "SUCC";
                    Response.Redirect("Register.aspx");
                }
            }
        }
    }
}
