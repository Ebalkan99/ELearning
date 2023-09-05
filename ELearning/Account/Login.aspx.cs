using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ELearning.Models;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;


namespace ELearning.Account
{
    public partial class Login : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {

            if (Membership.ValidateUser(Email.Text, Password.Text))
            {

                if (Roles.IsUserInRole(Email.Text, "Instructors"))
                {
                    App_Start.ELearningDataSetTableAdapters.tbl_InstructorsTableAdapter instructor = new App_Start.ELearningDataSetTableAdapters.tbl_InstructorsTableAdapter();
                    Session["instructorID"] = instructor.GetInstructorID(Email.Text);
                    FormsAuthentication.SetAuthCookie(Email.Text, true);
                    Response.Redirect("~/Default.aspx");
                }
                else if (Roles.IsUserInRole(Email.Text, "Students"))
                {
                    App_Start.ELearningDataSetTableAdapters.tbl_StudentsTableAdapter student = new App_Start.ELearningDataSetTableAdapters.tbl_StudentsTableAdapter();
                    Session["studentID"] = student.GetStudentID(Email.Text);
                    FormsAuthentication.SetAuthCookie(Email.Text, true);
                    Response.Redirect("~/Default.aspx");


                }
            }
        }
    }
}