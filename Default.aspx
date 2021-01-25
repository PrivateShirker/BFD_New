<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="BFD_New._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BFD Administration</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <header>
            <img alt="Header_Image.jpg" class="width55 topMargin1em bottomMargin1em" src="_Images/Header_Image.jpg" />
        </header>

        <div class="maroonBack">
            <div class="width50 autoMarginLeftRight topMargin2em maroonBack centerDiv regBorder showShadow">
                <p class="pTitle centerText">Buchanan Engine Company #1<br />Administration Program</p>

                <p class="pTitle topMargin1em centerText">Please enter your Security Code.<br />If you forgot your code call Pete at 352 289-4323</p>
                <br /><br />
                <span class="fontSize2em bold">Security Code:</span>
                <asp:TextBox ID="txtPWD" CssClass="leftMargin1em inLine" Font-Size="2em" Width="8em" BorderColor="Gold" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" runat="server" TextMode="Password" AutoCompleteType="Disabled" EnableTheming="False"></asp:TextBox>
                <asp:Panel ID="pwdIncorrectMess" Visible="false" runat="server">
                    <p class="pTitle centerText">The Security Code you entered was not correct.<br />Please try again</p>
                </asp:Panel>    
                <br /><br />
                <asp:Button ID="butSubmit" CssClass="autoMarginLeftRight leftMargin5em bottomMargin2em" Font-Size="2em" BorderColor="Gold" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" runat="server" Text=" Submit " OnClick="butSubmit_Click" />
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
