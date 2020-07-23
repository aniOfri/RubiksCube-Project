using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RubiksCube_Masterpage
{
    public partial class Manage : System.Web.UI.Page
    {
        public string db = "";
        public string info = "";
        public string allUsers = "";
        public string chngPassStatus;
        string managedUser;
        string fileName = "db.mdf";
        string tableName = "personalData";  
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["user"] == null)
                Response.Redirect("Home.aspx");
            else if (Session["user"].ToString() != "Manager")
                Response.Redirect("Home.aspx");

            if (Session["normal"] != null)
            {
                normalDiv.Style["display"] = "none";
                Button3.Value = "Show Specific";
                Button4.Style["Display"] = "block";

                if (Session["filtered"] == null)
                {
                    string allSql = "SELECT * FROM " + tableName;
                    allUsers = "</br><select id=\"filterCube\" name=\"filterCube\">"
                                    + "<option value=\"2x2\" selected> 2x2 Cube</ option>"
                                    + "<option value=\"3x3\"> 3x3 Cube</option>"
                                    + "<option value=\"4x4\"> 4x4 Cube</ option>"
                                    + "<option value=\"5x5\"> 5x5 Cube</ option>"
                                    + "<option value=\"6x6\"> 6x6 Cube</ option>"
                                    + "<option valu=\"oth\"> Other...</ option>"
                             + "</select>\n";
                    allUsers += MyAdoHelper.printDataTable(fileName, allSql).ToString();
                }
                else
                {
                    string allSql = "SELECT * FROM " + tableName + " WHERE Favcube ='" + Session["filtered"].ToString() + "'";
                    allUsers = "</br><select id=\"filterCube\" name=\"filterCube\">"
                                    + "<option value=\"2x2\" selected> 2x2 Cube</ option>"
                                    + "<option value=\"3x3\"> 3x3 Cube</option>"
                                    + "<option value=\"4x4\"> 4x4 Cube</ option>"
                                    + "<option value=\"5x5\"> 5x5 Cube</ option>"
                                    + "<option value=\"6x6\"> 6x6 Cube</ option>"
                                    + "<option valu=\"oth\"> Other...</ option>"
                             + "</select>\n";
                    allUsers += MyAdoHelper.printDataTable(fileName, allSql).ToString();
                }

            }
            else
            {
                normalDiv.Style["display"] = "block";
            }

            if (Session["managedUser"] != null)
            {
                managedUser = Session["managedUser"].ToString();
                UpdateInfo(managedUser);
            }
            else
            {
                managedUser = "Manager";
                UpdateInfo(managedUser);
            }

            string sql = "SELECT Username FROM " + tableName;
            db = printDataTable(fileName, sql).ToString();

            if (Request["changePass"] != null)
            {
                // Get form inputs
                string username = managedUser;
                string newpass = Request["password"].Replace(" ", "");

                // Update password on database
                string replaceQuery = "UPDATE " + tableName + " SET Password='" + newpass + "'";
                replaceQuery += "WHERE Username='" + username + "'";

                MyAdoHelper.DoQuery(fileName, replaceQuery);

                chngPassStatus = "New password updated successfully";
            }
        }

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string user = Request["userlist"];
            Session["managedUser"] = user;
            Response.Redirect("Manage.aspx");
        }

        protected void Button2_Click(object sender, System.EventArgs e)
        {
            string user = Request["userlist"];
            string deleteQuery = "DELETE FROM " + tableName + " WHERE Username = '" + user + "'";

            MyAdoHelper.DoQuery(fileName, deleteQuery);
            Response.Redirect("Manage.aspx");
        }

        protected void Button3_Click(object sender, System.EventArgs e)
        {
            if (Session["normal"] != null)
                Session["normal"] = null;
            else
                Session["normal"] = "1";
            Response.Redirect("Manage.aspx");
        }
        protected void Button4_Click(object sender, System.EventArgs e)
        {
            if (Session["filtered"] != null)
                Session["filtered"] = null;
            else
                Session["filtered"] = Request["filterCube"].ToString();
            Response.Redirect("Manage.aspx");
        }
        private void UpdateInfo(string username)
        {
            string sql = "SELECT * FROM " + tableName;
            sql += " WHERE ";
            sql += " Username ='" + username + "'";

            info = MyAdoHelper.printDataTable(fileName, sql).ToString();
        }
        public string printDataTable(string fileName, string sql)
        {
            DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

            string printStr = "<label for=\"users\">Choose a user:</label>";

            printStr += "<select value=\""+managedUser+"\" id=\"users\" name=\"userlist\">";
            foreach (DataRow row in dt.Rows)
            {
                foreach (object myItemArray in row.ItemArray)
                {
                    printStr += "<option value=\"" + myItemArray.ToString() + "\">" + myItemArray.ToString() + "</option>";
                    if (myItemArray.ToString() == managedUser)
                        printStr = printStr.Replace("<option value=\"" + myItemArray.ToString(), "<option selected=\"selected\" value=\"" + myItemArray.ToString());
                }
            }
            printStr += "</select>";

            return printStr;
        }
    }
    
}