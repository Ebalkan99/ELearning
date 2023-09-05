using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Xpo;
using ELearning.App_Start.ELearningDataSetTableAdapters;

namespace ELearning.Instructors
{
    public partial class AddCourses : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                App_Start.ELearningDataSetTableAdapters.tbl_CoursesTableAdapter icourses = new App_Start.ELearningDataSetTableAdapters.tbl_CoursesTableAdapter();
                ASPxGridView1.DataSource = icourses.GetByInstrcID(Convert.ToInt32(Session["instructorID"]));
                ASPxGridView1.DataBind();
            }
        }
        protected void btnAddNewCourse_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }
        protected void btnsave1_Click(object sender, EventArgs e)
        {
            try
            {
                App_Start.ELearningDataSetTableAdapters.tbl_CoursesTableAdapter icourses = new App_Start.ELearningDataSetTableAdapters.tbl_CoursesTableAdapter();
                icourses.Insert(Convert.ToInt32(Session["instructorID"]), txttitle.Text, htmlContent.Html);
                //MultiView1.SetActiveView(View1);
                Response.Redirect("~/Instructors/AddCourses.aspx");
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.ToString();
            }
        }
    }
}