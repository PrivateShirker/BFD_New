<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PurchaseOrders.aspx.vb" Inherits="BFD_New.PurchaseOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase Orders</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="pnlMain" BackColor="Maroon" Visible="true" runat="server">
            <p class="pTitle topMargin1em centerText">Bfd Administration<br />Purchase Orders</p>
            
            <hr class="myHr" />

            <div class="maroonDiv">
                <asp:Panel ID="pnlPoDefault" Visible="true" runat="server">
                    <aside class="topMargin1em" style="background-color:maroon;min-height:40em;">
                        <div>
                            <p class="pTitle centerText">Purchase Orders</p>
                        </div>
                        <hr class="myHr" />
                        <asp:ListBox ID="lstPOs" Font-Size="Large" CssClass="leftMargin1em topMargin1em" Width="90%" runat="server" style="min-height:30em;" OnSelectedIndexChanged="lstPOs_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                    </aside>

                    <section class="floatLeft maroonBack topMargin1em leftMargin1em width75 maroonBorder showShadow" style="min-height:30em; background-color:white;">
                        <asp:Panel ID="pnlDefault" BackColor="White" runat="server">
                            <div class="autoMarginLeftRight width50 topMargin8em padding10 maroonBorder showShadow">
                                <p class="pTitle centerText maroonText" style="background-color:white;">Please select a Purchase Order.</p>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlShowPO" BackColor="White" Visible="false" runat="server">
                            <div class="blackBorder width90 autoMarginLeftRight topMargin2em padding10" style="background-color:white;">
                                <div style="background-color:white;">
                                    <asp:Label ID="lblPONum" CssClass="leftMargin4em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="PO Number:"></asp:Label>
                                    <asp:Label ID="lblMemID" CssClass="leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="Member ID:"></asp:Label>
                                    <asp:Label BackColor="White" CssClass="leftMargin1em" ForeColor="Black" Font-Bold="true" Font-Size="2em" runat="server" Text="Net 30 Days"></asp:Label>
                                </div>
                                <div style="background-color:white;">
                                    <asp:Label ID="lblOrderDate" CssClass="leftMargin8em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="Order Date: "></asp:Label>
                                    <asp:Label ID="lblTCode" CssClass="leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="TCode: "></asp:Label>
                                </div>
                            </div>
                
                            <p class="pTitle centerText underLine topMargin1em blackText" style="background-color:white;">Vendor Information</p>

                            <div class="blackBorder width90 autoMarginLeftRight topMargin1em padding5" style="background-color:white;">
                                <div class="floatLeft width45 topMargin1em leftMargin3em autoMarginLeftRight" style="background-color:white;">
                                    <asp:Label ID="lblVendorName" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblVendorAddress" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblVendorCity" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="lblVendorState" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="lblVendorZip" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                </div>

                                <div class="floatLeft width45 topMargin1em leftMargin2em autoMarginLeftRight" style="background-color:white;">
                                    <asp:Label ID="lblVendorPhone" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblVendorFax" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblVendorEMail" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                                </div>

                                <div class="clear"></div>
                            </div>

                            <div class="blackBorder width90 autoMarginLeftRight topMargin1em bottomMargin2em padding10" style="background-color:white;">

                                <p class="pTitle underLine leftMargin6em blackText" style="background-color:white;">Items</p>
                        
                                <div class="floatLeft width60 blackBorder" style="background-color:white;">
                                    <asp:GridView ID="gvItems" CssClass="bottomMargin1em" BackColor="White" ForeColor="Black" AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="Quantity" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Quantity" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" 
                                                SortExpression="Quantity" />
                                            <asp:BoundField DataField="Item" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Item" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black"  
                                                SortExpression="Item" />
                                            <asp:BoundField DataField="Unit_Price" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Unit Price" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" 
                                                SortExpression="Unit_Price" />
                                            <asp:BoundField DataField="Cost" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Cost" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black"/>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <div class="floatLeft width35 blackBorder leftMargin1em" style="background-color:white;">
                                    <asp:Label ID="lblTotalCost" CssClass=" leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="Total Cost:"></asp:Label>
                                </div>

                                <div class="clear"></div>
                            </div>

                            <asp:Panel ID="pnlMessage" Visible="false" runat="server">
                                <div class="autoMarginLeftRight topMargin2em centerDiv width70">
                                    <asp:Label ID="lblDeleteMess" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text="Text"></asp:Label>
                                </div>
                                <div class="autoMarginLeftRight bottomMargin1em centerDiv width50 topMargin1em">
                                    <asp:Button ID="btnDeleteYes" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" Yes " OnClick="btnDeleteYes_Click"/>
                                    <asp:Button ID="btnDeleteNo" CssClass="leftMargin1em" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" No " OnClick="btnDeleteNo_Click" />
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlPOButs" CssClass="centerDiv topMarginMinus1em" Visible="true" runat="server">
                                <asp:Button ID="btnEdit" BackColor="Gold" CssClass="inline topMargin1em padding5" Visible="true" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Edit PO " OnClick="btnEdit_Click" />
                                <asp:Button ID="btnDelete" BackColor="Gold" CssClass="inline leftMargin1em topMargin1em padding5" Visible="true" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Delete PO " OnClick="btnDelete_Click" />
                                <asp:Button ID="btnPrint" BackColor="Gold" CssClass="inline leftMargin1em topMargin1em padding5" Visible="true" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Print PO " OnClick="btnPrint_Click" />
                            </asp:Panel>

                        </asp:Panel>

                        <asp:Panel ID="pnlReturn" CssClass="centerDiv" runat="server">
                            <asp:Button ID="btnReturn" BackColor="Gold" CssClass="inline bottomMargin1em topMargin1em padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Return to Main Menu " onclick="btnReturn_Click" />
                        </asp:Panel>
                    </section>

                </asp:Panel>

                <asp:Panel ID="pnlEditPO" Visible="false" runat="server">
                    <div class="centerDiv topMargin1em bottomMargin1em">
                        <asp:Label ID="lblEditPONum" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="Edit PO Number: "></asp:Label>
                    </div>
                    <asp:Panel ID="Panel3" CssClass="autoMarginLeftRight topMargin2em blackBorder" BackColor="White" ForeColor="Black" width="90%" runat="server">
                        <div class="width80 autoMarginLeftRight">
                            <div class="floatLeft centerDiv width40 topMargin1em leftMargin1em">
                                <asp:Label ID="Label4" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="Vendors"></asp:Label>
                                <asp:ListBox ID="lstVendors" CssClass="bottomMargin1em" Font-Bold="true" BackColor="White" ForeColor="Black" Width="100%" Font-Size="1.5em" runat="server"></asp:ListBox>
                            </div>

                            <div class="floatLeft centerDiv width50 topMargin1em leftMargin2em">
                                <asp:Label ID="Label5" CssClass="block" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text="TCodes"></asp:Label>
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
                                    <asp:Label ID="Label6" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Quantity"></asp:Label>
                                </td>
                                <td class="width80 blackBorder centerDiv">
                                    <asp:Label ID="Label9" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Items"></asp:Label>
                                </td>
                                <td class="width20 blackBorder centerDiv">
                                    <asp:Label ID="Label10" Font-Bold="true" Font-Size="2em" Width="100%" runat="server" Text="Unit Price"></asp:Label>
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
                    
                    <asp:Panel ID="pnlEditButs" CssClass="bottomMargin1em topMargin2em centerDiv" BackColor="White" runat="server">
                        <asp:Button ID="btnEditSave" BackColor="Gold" CssClass="inline padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text="Save Edit" OnClick="btnEditSave_Click" />
                        <asp:Button ID="btnEditCancel" BackColor="Gold" CssClass="inline leftMargin1em  padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text="Cancel Edit" OnClick="btnEditCancel_Click" />
                    </asp:Panel>
                </asp:Panel>
            </div>

        </asp:Panel>
        
        <asp:Panel ID="pnlPrint" Visible="false" BackColor="White" ForeColor="Black" runat="server" Style="min-height:30em;">
        <section class="backWhite topMargin8em">
            <div class="printDiv centerDiv">
                <asp:Button ID="btnReturntoPO" CssClass="floatRight rightMargin2em" ForeColor="Maroon" runat="server" Text=" r " OnClick="btnReturntoPO_Click" />
                <div class="clear"></div>
                <asp:Label ID="Label1" CssClass="block" Font-Size="3em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">Buchanan Engine Company No. 1</asp:Label>
                <asp:Label ID="Label2" CssClass="block" Font-Size="3em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">2912 Albany Post Road</asp:Label>
                <asp:Label ID="Label3" CssClass="block" Font-Size="3em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">Buchanan, New York 10511</asp:Label>
            </div>

            <hr class="blackHr" />
            <div class="printDiv autoMarginLeftRight width60 centerDiv">
                <div class="blackBorder width90 autoMarginLeftRight topMargin2em padding10" style="background-color:white;">
                    <div style="background-color:white;">
                        <asp:Label ID="lblPrintPONum" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblPrintMemID" CssClass="leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text=""></asp:Label>
                        <asp:Label BackColor="White" CssClass="leftMargin1em" ForeColor="Black" Font-Bold="true" Font-Size="2em" runat="server" Text="Net 30 Days"></asp:Label>
                    </div>
                    <div style="background-color:white;">
                        <asp:Label ID="lblPrintOrderDate" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="Order Date: "></asp:Label>
                        <asp:Label ID="lblPrintTCode" CssClass="leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="TCode: "></asp:Label>
                    </div>
                </div>
            </div>

            <p class="pTitle centerText underLine topMargin1em blackText" style="background-color:white;">Vendor Information</p>

            <div class="blackBorder width60 autoMarginLeftRight topMargin1em padding5" style="background-color:white;">
                <div class="floatLeft width45 topMargin1em leftMargin3em autoMarginLeftRight" style="background-color:white;">
                    <asp:Label ID="lblPrintVendorName" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPrintVendorAddress" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPrintVendorCity" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="lblPrintVendorState" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="lblPrintVendorZip" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                </div>

                <div class="floatLeft width45 topMargin1em leftMargin2em autoMarginLeftRight" style="background-color:white;">
                    <asp:Label ID="lblPrintVendorPhone" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPrintVendorFax" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPrintVendorEMail" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server"></asp:Label>
                </div>

                <div class="clear"></div>
            </div>

            <div class="blackBorder width90 autoMarginLeftRight topMargin1em bottomMargin2em padding10" style="background-color:white;">

                <p class="pTitle underLine leftMargin6em blackText" style="background-color:white;">Items</p>
                        
                <div class="floatLeft width60 blackBorder" style="background-color:white;">
                    <asp:GridView ID="gvPrintItems" CssClass="bottomMargin1em" BackColor="White" ForeColor="Black" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:BoundField DataField="Quantity" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Quantity" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" 
                                SortExpression="Quantity" />
                            <asp:BoundField DataField="Item" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Item" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black"  
                                SortExpression="Item" />
                            <asp:BoundField DataField="Unit_Price" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Unit Price" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" 
                                SortExpression="Unit_Price" />
                            <asp:BoundField DataField="Cost" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="2em" HeaderText="Cost" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black"/>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="floatLeft width35 blackBorder leftMargin1em" style="background-color:white;">
                    <asp:Label ID="lblPrintTotalCost" CssClass=" leftMargin1em" BackColor="White" ForeColor="Black" Font-Size="2em" Font-Bold="true" runat="server" Text="Total Cost:"></asp:Label>
                </div>

                <div class="clear"></div>
            </div>

            <div class="centerDiv">
                <asp:Label ID="Label14" BackColor="White" ForeColor="Black" Font-Size="3em" Font-Bold="true" runat="server" Text="Approval Signatures"></asp:Label>
            </div>
            <div class="autoMarginLeftRight width95 topMargin2em bottomMargin5em backWhite blackBorder padding10">
                <div class="floatLeft leftMargin1em topMargin1em width45">
                    <asp:Label ID="Label13" CssClass="topMargin2em" BackColor="White" ForeColor="Black" Font-Size="2.5em" Font-Bold="true" runat="server" Text="Chief: ______________________"></asp:Label>
                </div>
                <div class="floatLeft leftMargin1em width45">
                    <asp:Label ID="Label11" CssClass="topMargin2em" BackColor="White" ForeColor="Black" Font-Size="2.5em" Font-Bold="true" runat="server" Text="Trustee #1: ______________________"></asp:Label>
                    <br /><br />
                    <asp:Label ID="Label12" CssClass="topMargin4em bottomMargin2em" BackColor="White" ForeColor="Black" Font-Size="2.5em" Font-Bold="true" runat="server" Text="Trustee #2: ______________________"></asp:Label>
                </div>
                <div class="clear"></div>
            </div>
            </section>
        </asp:Panel>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
