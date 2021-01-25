<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Main.aspx.vb" Inherits="BFD_New.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Menu</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <article id="Menu" class="myArts block">
            <p class="pTitle topMargin1em centerText">Bfd Administration<br />Main Menu</p>
            <hr class="myHr" />

            <asp:Panel ID="Panel1" CssClass="autoMarginLeftRight width50 topMargin4em regBorder" BackColor="Gold" ForeColor="Maroon" runat="server">
                <asp:Button ID="btnShowPOs" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="50%" runat="server" Text="Show Purchase Orders" OnClick="btnShowPOs_Click" ToolTip="Click to show all Puchase Orders" />
                <asp:Button ID="btnNewPO" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="50%" runat="server" Text="New Purchase Order" OnClick="btnNewPO_Click" />
                <asp:Button ID="btnVendors" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="50%" runat="server" Text="Edit Vendors" OnClick="btnVendors_Click" />
                <asp:Button ID="btnUsers" CssClass="autoMarginLeftRight block topMargin1em bottomMargin1em" Font-Size="2em" Width="50%" runat="server" Text="Edit Users" OnClick="btnUsers_Click" />
            </asp:Panel>
        </article>


        <article id="NewPO" class="myArts noDisplay">>
            <p class="pTitle topMargin1em centerText">Bfd Administration<br />Create New Purchase Order</p>
            <hr class="myHr" />

            <asp:Panel ID="Panel3" CssClass="autoMarginLeftRight topMargin2em blackBorder" BackColor="White" ForeColor="Black" width="90%" runat="server">
                <div class="floatLeft centerDiv width20 topMargin1em leftMargin3em">
                    <asp:Label ID="Label1" CssClass="block" BackColor="White" ForeColor="Black" Font-Bold="true" Font-Size="2em" runat="server" Text="Authors"></asp:Label>
                    <asp:ListBox ID="lstAuthors" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                </div>

                <div class="floatLeft centerDiv width30 topMargin1em leftMargin1em">
                    <asp:Label ID="Label2" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="Vendors"></asp:Label>
                    <asp:ListBox ID="lstVendors" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                </div>

                <div class="floatLeft centerDiv width40 topMargin1em leftMargin1em">
                    <asp:Label ID="Label3" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="TCodes"></asp:Label>
                    <asp:ListBox ID="lstTCodes" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                </div>

                <div class="clear bottomMargin1em"></div>
            </asp:Panel>

            <div class="clear"></div>

            <asp:Panel ID="Panel4" CssClass="autoMarginLeftRight bottomMargin1em topMargin2em centerDiv blackBorder" BackColor="White" ForeColor="Black" width="90%" runat="server">
                <asp:Label ID="Label7" Font-Bold="true" Font-Size="2em" Font-Underline="true" BackColor="White" ForeColor="Black" runat="server" Text="PO Items"></asp:Label>
                <table class="topMargin1em bottomMargin1em backWhite">
                    <tr>
                        <td class="width10 blackBorder centerDiv">
                            <asp:Label ID="Label4" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Quantity"></asp:Label>
                        </td>
                        <td class="width80 blackBorder centerDiv">
                            <asp:Label ID="Label5" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Item"></asp:Label>
                        </td>
                        <td class="width20 blackBorder centerDiv">
                            <asp:Label ID="Label6" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Cost"></asp:Label>
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
            <div class="centerDiv">
                <asp:Button ID="btnSavePO" BackColor="Gold" Font-Bold="true" Font-Size="2em" ForeColor="Maroon" runat="server" Text=" Save PO " />
                <asp:Button ID="btnReturnMenu" CssClass="leftMargin1em" BackColor="Gold" Font-Bold="true" Font-Size="2em" ForeColor="Maroon" runat="server" Text=" Return to Menu " />
            </div>
        </article>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
