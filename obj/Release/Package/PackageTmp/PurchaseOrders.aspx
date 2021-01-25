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
        <asp:Panel ID="pnlMain" Visible="true" runat="server">
            <p class="pTitle topMargin1em centerText">Bfd Administration<br />Purchase Orders</p>
            <hr class="myHr" />

            <div class="maroonDiv">
                <aside class="topMargin1em" style="background-color:maroon;min-height:40em;">
                    <div>
                        <p class="pTitle centerText">Purchase Orders</p>
                    </div>
                    <hr class="myHr" />
                    <asp:ListBox ID="lstPOs" Font-Size="Large" CssClass="leftMargin1em topMargin1em" Width="90%" runat="server" style="min-height:30em;" OnSelectedIndexChanged="lstPOs_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                </aside>

                <div class="floatLeft maroonBack topMargin1em leftMargin1em width75 regBorder" style="min-height:30em; background-color:white;">
                    <asp:Panel ID="pnlDefault" BackColor="White" Visible="true" runat="server">
                        <div class="autoMarginLeftRight width50 topMargin8em padding10 maroonBorder showShadow">
                            <p class="pTitle centerText maroonText" style="background-color:white;">Please select a Purchase Order.</p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="ShowPO" BackColor="White" Visible="false" runat="server">
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
                            <div class="autoMarginLeftRight centerDiv width50 topMargin1em">
                                <asp:Button ID="btnDeleteYes" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" Yes " OnClick="btnDeleteYes_Click"/>
                                <asp:Button ID="btnDeleteNo" CssClass="leftMargin1em" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=" No " OnClick="btnDeleteNo_Click" />
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlPOButs" CssClass="centerDiv topMarginMinus1em" Visible="true" runat="server">
                            <asp:Button ID="btnDelete" BackColor="Gold" CssClass="inline bottomMargin1em topMargin1em padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Delete PO " OnClick="btnDelete_Click" />
                        </asp:Panel>

                    </asp:Panel>
                </div>

                <asp:Panel ID="pnlReturn" CssClass="topMargin1em centerDiv" runat="server">
                    <asp:Button ID="btnReturn" BackColor="Gold" CssClass="inline bottomMargin1em topMargin1em padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Return to Main Menu " onclick="btnReturn_Click" />
                    <asp:Button ID="btnPrint" BackColor="Gold" CssClass="inline leftMargin2em bottomMargin1em topMargin1em padding5" ForeColor="Maroon" Font-Bold="true" Font-Size="2em" runat="server" Text=" Print " OnClick="btnPrint_Click" />
                </asp:Panel>
            </div>

            <asp:Panel ID="Panel1" Visible="false" runat="server">
                <asp:Timer ID="Timer2" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlPrint" Visible="false" BackColor="White" ForeColor="Black" runat="server" Style="min-height:30em;">
            <div class="printDiv centerDiv">
                <asp:Label ID="Label1" CssClass="block" Font-Size="2em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">Buchanan Engine Company No. 1</asp:Label>
                <asp:Label ID="Label2" CssClass="block" Font-Size="2em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">2912 Albany Post Road</asp:Label>
                <asp:Label ID="Label3" CssClass="block" Font-Size="2em" BackColor="White" Font-Bold="true" ForeColor="Black" runat="server" Text="Label">Buchanan, New York 10511</asp:Label>
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

        </asp:Panel>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
