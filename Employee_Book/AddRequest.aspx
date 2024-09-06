<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRequest.aspx.cs" Inherits="Employee_Book.AddRequest" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    function validateEmail(sender, args) {
        var email = sender.value;
        // Simple regex for email validation
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        args.IsValid = emailPattern.test(email);
    }
</script>--%>
<%--</asp:Content>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <form id="form1" runat="server">
            <div class="mb-3">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="EmailInput" CssClass="form-label">Email address</asp:Label>
                <asp:TextBox ID="EmailInput" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:CustomValidator ID="EmailValidator" runat="server" ControlToValidate="EmailInput" 
                    ErrorMessage="Please enter a valid email address." 
                    ClientValidationFunction="validateEmail" 
                    CssClass="form-text" Display="Dynamic"></asp:CustomValidator>
            </div>
            <div class="mb-3">
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="PasswordInput" CssClass="form-label">Password</asp:Label>
                <asp:TextBox ID="PasswordInput" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3 form-check">
                <asp:CheckBox ID="CheckBoxInput" runat="server" CssClass="form-check-input"></asp:CheckBox>
                <asp:Label ID="CheckBoxLabel" runat="server" AssociatedControlID="CheckBoxInput" CssClass="form-check-label">Check me out</asp:Label>
            </div>
            <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="SubmitButton_Click" />
        </form>
    </div>
</asp:Content>

