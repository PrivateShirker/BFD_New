<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Users.aspx.vb" Inherits="BFD_New.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <p class="pTitle topMargin1em centerText">BFD Administration<br />Edit Users</p>
        <hr class="myHr" />
        <asp:HiddenField ID="myID" runat="server" />

        <aside class="floatLeft width20 topMargin1em yellowBorder">
            <asp:Label ID="Label1" CssClass="block centerDiv" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Users"></asp:Label>
            <asp:ListBox ID="lstUsers" Font-Size="Large" Width="95%" ForeColor="LightGray" CssClass="leftMargin1em topMargin1em" style="min-height:20em;max-height:20em;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstUsers_SelectedIndexChanged"></asp:ListBox>
            
            <div class="centerDiv maroonBack">
                <asp:Button ID="btnAddNew" CssClass="topMargin1em autoMarginLeftRight" Visible="true" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Add New User" OnClick="btnAddNew_Click" />
                <asp:Button ID="btnEdit" CssClass="topMargin1em autoMarginLeftRight" Visible="false" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Edit Users" />
                <asp:Button ID="btnReturnMain" CssClass="topMargin1em autoMarginLeftRight block topMargin1em" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Return to Main Menu" OnClick="btnReturnMain_Click" />
            </div>
        </aside>  

        <asp:Panel ID="pnlDefault" CssClass="floatLeft width70 maroonBack leftMargin2em topMargin4em" Visible="true" runat="server">
            <p class="centerText fontSize2em topMargin3em bold block">Please select a User from the User List</p>
        </asp:Panel>

        <asp:Panel ID="pnlUserData" CssClass="floatLeft width70 maroonBack leftMargin2em topMargin4em yellowBorder" Visible="false" runat="server">
            <div class="autoMarginLeftRight width25 maroonBack">
                <asp:Label ID="lblEditUser" CssClass="autoMarginLeftRight" Visible="true" Font-Size="2em" Font-Bold="true" runat="server" Text=" Edit User "></asp:Label>
                <asp:Label ID="lblAddUser" CssClass="autoMarginLeftRight" Visible="false" Font-Size="2em" Font-Bold="true" runat="server" Text=" Add New User"></asp:Label>
            </div>
                    
            <div class="centerDiv topMargin3em maroonBack">
                <asp:Label ID="Label2" Font-Size="1.5em" Font-Bold="true" runat="server" Text="First Name: "></asp:Label>
                <asp:TextBox ID="txtFirstName" CssClass="leftMarginHalfem padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="10em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                <asp:Label ID="Label11" CssClass="leftMargin2em" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Last Name: "></asp:Label>
                <asp:TextBox ID="txtLastName" CssClass="leftMarginHalfem padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="10em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
            </div>

            <div class="centerDiv topMargin3em maroonBack">
                <asp:Label ID="Label12" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Security Level: "></asp:Label>
                <asp:TextBox ID="txtSecurity" CssClass="leftMarginHalfem padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="2em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                <asp:Label ID="Label13" CssClass="leftMargin2em" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="txtPassword" CssClass="leftMarginHalfem padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="5em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                <asp:Label ID="Label3" CssClass="leftMargin2em" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Member ID: "></asp:Label>
                <asp:TextBox ID="txtMembID" CssClass="leftMarginHalfem padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="5em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
            </div>

            <asp:Panel ID="pnlSaveMess" Visible="false" BackColor="Maroon" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width50 maroonBack">
                    <asp:Label ID="lblSaveMess" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Moccasin" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlDeleteMess" Visible="False" BackColor="Maroon" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width70 maroonBack">
                    <asp:Label ID="lblDeleteMess" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text="Text"></asp:Label>
                </div>
                <div class="autoMarginLeftRight centerDiv width50 topMargin1em maroonBack">
                    <asp:Button ID="btnDeleteYes" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" Yes " OnClick="btnDeleteYes_Click" />
                    <asp:Button ID="btnDeleteNo" CssClass="leftMargin1em" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" No " OnClick="btnDeleteNo_Click" />
                </div>
            </asp:Panel>

            <asp:Panel ID="UserSaveChangesBut" Visible="true" CssClass="autoMarginLeftRight maroonBack topMargin2em bottomMargin2em" runat="server">
                <div class="autoMarginLeftRight width50 centerDiv maroonBack">
                    <asp:Button ID="btnSave" CssClass="inline" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Save Changes " OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" CssClass="inline leftMargin2em" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Delete User " OnClick="btnDelete_Click" />
                </div>
            </asp:Panel>

            <asp:Panel ID="UserAddButs" Visible="false" CssClass="autoMarginLeftRight topMargin2em centerDiv maroonBack bottomMargin2em" runat="server">
                <asp:Button ID="btnSaveNewUser" CssClass="inline" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Save New Vendor " OnClick="btnSaveNewUser_Click" />
                <asp:Button ID="btnCancelNewUser" CssClass="leftMargin1em inline" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Cancel Add " OnClick="btnCancelNewUser_Click" />
            </asp:Panel>
        </asp:Panel>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
