using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ELearning.Instructors;

namespace ELearning.Students
{
    public partial class ViewCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                App_Start.ELearningDataSetTableAdapters.vw_ViewCoursesTableAdapter icourses = new App_Start.ELearningDataSetTableAdapters.vw_ViewCoursesTableAdapter();
                //ASPxCardView1.DataSource = icourses.GetData();
                //ASPxCardView1.DataBind();
            }

        }
    }
}