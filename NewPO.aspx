<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewPO.aspx.vb" Inherits="BFD_New.NewPO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Purchase Order</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="maroonBack" style="padding-bottom:.5em;">
            <p class="pTitle topMargin1em centerText">Bfd Administration<br />Create New Purchase Order</p>
            <hr class="myHr" />
        </div>

        <section class="autoMarginLeftRight backWhite padding5 bottomMargin1em topMarginHalfem width95 blackBorder">
            <asp:Panel ID="Panel3" CssClass="autoMarginLeftRight topMargin2em blackBorder" BackColor="White" ForeColor="Black" width="90%" runat="server">
                <div class="width80 autoMarginLeftRight">
                    <div class="floatLeft centerDiv width40 topMargin1em leftMargin1em">
                        <asp:Label ID="Label2" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="Vendors"></asp:Label>
                        <asp:ListBox ID="lstVendors" CssClass="bottomMargin1em" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                    </div>

                    <div class="floatLeft centerDiv width50 topMargin1em leftMargin2em">
                        <asp:Label ID="Label3" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="TCodes"></asp:Label>
                        <asp:ListBox ID="lstTCodes" CssClass="bottomMargin1em" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                    </div>

                    <div class="clear"></div>
                </div>
            </asp:Panel>

            <div class="centerDiv backWhite topMargin1em">
                <asp:Label ID="Label8" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="1.5em" runat="server" Text="PO Date:"></asp:Label>
                <asp:TextBox ID="txtPODate" CssClass="leftMarginHalfem inLine" Font-Size="1.5em" Width="8em" BackColor="White" ForeColor="Black" Font-Bold="true" runat="server"></asp:TextBox>
            </div>

            <asp:Panel ID="Panel4" CssClass="autoMarginLeftRight bottomMargin1em topMargin2em centerDiv blackBorder" BackColor="White" ForeColor="Black" width="90%" runat="server">
                <asp:Label ID="Label7" Font-Bold="true" Font-Size="2em" Font-Underline="true" BackColor="White" ForeColor="Black" runat="server" Text="PO Items"></asp:Label>
                <table class="topMargin1em bottomMargin1em backWhite">
                    <tr>
                        <td class="width10 blackBorder centerDiv">
                            <asp:Label ID="Label4" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Quantity"></asp:Label>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:Label ID="Label5" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Items"></asp:Label>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:Label ID="Label6" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Unit Price"></asp:Label>
                        </td>
                    </tr>
                    <tr class="topMarginHalfem">
                        <td class="width10 blackBorder centerDiv">
                            <asp:TextBox ID="txtQuantity1" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:TextBox ID="txtItem1" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server" ></asp:TextBox>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:TextBox ID="txtCost1" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="topMarginHalfem">
                        <td class="width10 blackBorder centerDiv">
                            <asp:TextBox ID="txtQuantity2" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:TextBox ID="txtItem2" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server" ></asp:TextBox>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:TextBox ID="txtCost2" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="topMarginHalfem">
                        <td class="width10 blackBorder centerDiv">
                            <asp:TextBox ID="txtQuantity3" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:TextBox ID="txtItem3" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server" ></asp:TextBox>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:TextBox ID="txtCost3" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="topMarginHalfem">
                        <td class="width10 blackBorder centerDiv">
                            <asp:TextBox ID="txtQuantity4" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:TextBox ID="txtItem4" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server" ></asp:TextBox>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:TextBox ID="txtCost4" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="topMarginHalfem">
                        <td class="width10 blackBorder centerDiv">
                            <asp:TextBox ID="txtQuantity5" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:TextBox ID="txtItem5" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server" ></asp:TextBox>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:TextBox ID="txtCost5" Font-Bold="true" Font-Size="2em" Width="100%" BackColor="White" ForeColor="Black" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <div class="centerDiv topMargin1em">
                <asp:Button ID="btnSavePO" BackColor="Gold" Font-Bold="true" Font-Size="2em" ForeColor="Maroon" runat="server" Text=" Save PO " OnClick="btnSavePO_Click" />
                <asp:Button ID="btnSavenAdd" CssClass="leftMargin1em" BackColor="Gold" Font-Bold="true" Font-Size="2em" ForeColor="Maroon" runat="server" Text=" Save and Add Another " OnClick="btnSavenAdd_Click" />
                <asp:Button ID="btnReturnMenu" CssClass="leftMargin1em" BackColor="Gold" Font-Bold="true" Font-Size="2em" ForeColor="Maroon" runat="server" Text=" Return to Menu " OnClick="btnReturnMenu_Click" />
            </div>

            <div class="clear"></div>
        </section>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
