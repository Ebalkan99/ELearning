<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AddCourses.aspx.cs" Inherits="ELearning.Instructors.AddCourses" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h3>Courses</h3>
    <hr />
    <asp:Label ID="lblerror" runat="server" font-Bold="true" ForeColor="Maroon"></asp:Label>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <h5>List of Courses</h5>
            <br />
             <div style="float:right">
                 <asp:Button ID="btnAddNewCourse" OnClick="btnAddNewCourse_Click" CssClass="btn-btn-info" runat="server" Text="Add New Course" />
             </div>
            <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="course_title" Caption="Courses"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn>
                        <DataItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Add Quiz Question" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                     <dx:GridViewDataColumn>
                        <DataItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Add Quiz Answer" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
            </dx:ASPxGridView>
        </asp:View>
    <asp:View ID="View2" runat="server">
        <h5>Add a New Courses</h5>
        <br />
        <div class="col-md-2" style="padding:5px">
            Course Title
        </div>
        <div class="col-md-10">
            <asp:TextBox ID="txttitle" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2"style="padding:5px">
            Course Content
        </div>
        <div class="col-md-10" style="padding:5px">
         <%-- Bu satıra aspxhtml gelecek --%>
            <dx:ASPxHtmlEditor runat="server" ID="htmlContent"></dx:ASPxHtmlEditor>
        
        </div>
        <div class="col-md-2" style="padding:5px"></div>
        <div class="col-md-10" style="padding:5px">
            <asp:Button ID="btnsave1" OnClick="btnsave1_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Continue" />
        </div>

    </asp:View>
        <asp:View ID="View3" runat="server">
            <h5>Add Quiz Questions</h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView2" width="100%" runat="server"></dx:ASPxGridView>
           <br />
            <asp:Button ID="btnsave2" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Continue" />

        </asp:View>
          <asp:View ID="View4" runat="server">
            <h5>Add Quiz Questions Answers</h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView3" width="100%" runat="server"></dx:ASPxGridView>
            <br />
            <asp:Button ID="btnsaveFinish" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Finish" />
        
           </asp:View>
        
       
    </asp:MultiView>

</asp:Content>