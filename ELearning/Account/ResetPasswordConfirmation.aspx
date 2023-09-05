<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="ELearning.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div>
        <p>Your password is changed. To log in <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">this</asp:HyperLink> click </p>
    </div>
</asp:Content>
