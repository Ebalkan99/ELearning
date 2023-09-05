<%@ Page Title="Hesabı Yönet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ELearning.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Hesap ayarlarınızı değiştirin</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Parola:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Değiştir]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Oluştur]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>Dış Oturum Açmalar:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Yönet]" runat="server" />

                    </dd>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                    --%>
                    <%--
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Ekle]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Değiştir]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Kaldır]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>İki Öğeli Kimlik Doğrulama:</dt>
                    <dd>
                        <p>
                            Yapılandırılmış iki öğeli kimlik doğrulama sağlayıcısı yok. Bu ASP.NET uygulamasını iki öğeli kimlik doğrulamayı destekleyecek şekilde ayarlama
                            konusunda ayrıntılı bilgi için <a href="https://go.microsoft.com/fwlink/?LinkId=403804">bu makaleye</a>bakın.
                        </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
