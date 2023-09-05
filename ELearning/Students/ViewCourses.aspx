<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCourses.aspx.cs" Inherits="ELearning.Students.ViewCourses" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>List of Courses</h3>
    <hr />
    
    <dx:ASPxCardView ID="ASPxCardView1" width="100%" runat="server">
        <Columns>
            
            <dx:CardViewTextColumn FieldName="course_title"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="instructor_name"></dx:CardViewTextColumn>

        </Columns>
        <Templates>
            <Card>

              <div style="padding:10px" >
                 <asp:LinkButton ID="LinkButton1" Font-Bold="true" runat="server"><%=Eval("course_title") %></asp:LinkButton>
                 <br />
                 <br />
                 <h4>BY</h4> 
                 <h3>
                 <%=Eval("instructor_name") %>
                 </h3>
                 </div>
            </Card>
        </Templates>
    </dx:ASPxCardView>
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h3>Courses</h3>
    <asp:MultiView ID="MUltiView1" runat="server" ActiveViewIndex="0">
 <asp:View ID="View1" runat="server">
            <p>CYBER SECURITY<br />
                Cyber security is the application of technologies, processes, and controls to protect systems, networks, programs, devices and data from cyber attacks.<br />
                It aims to reduce the risk of cyber attacks and protect against the unauthorised exploitation of systems, networks, and technologies.

            </p>
     <a href="https://www.itgovernance.co.uk/what-is-cybersecurity">Contine this course sources</a>
        </asp:View>
    </asp:MultiView>
       
</asp:Content>

     
