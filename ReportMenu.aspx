<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportMenu.aspx.vb" Inherits="BFD_New.ReportMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Menu</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfReport" runat="server" />
        <asp:HiddenField ID="hfPOSort" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblGhost" Visible="false" runat="server" Text="Label"></asp:Label>
        <asp:Panel ID="pnlMenuArt" CssClass="autoMarginLeftRight topMargin4em" Width="60%" Visible="true" BackColor="Gold" runat="server" Style="padding:2em 0 2em 0;">
            <p class="pTitle backGold centerText">Reports Menu</p>
            <hr class="myHr" />

            <asp:Panel ID="Panel3" CssClass="autoMarginLeftRight width50 topMargin2em regBorder" BackColor="Gold" ForeColor="Maroon" runat="server">
                <asp:Button ID="btnPOReport" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="75%" runat="server" Text="Purchase Order Report" OnClick="btnPOReport_Click" />
                <asp:Button ID="btnVendor_Totals" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="75%" runat="server" Text="Vendor Totals Report" OnClick="btnVendor_Totals_Click" />
                <asp:Button ID="btnTCodeReport" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="75%" runat="server" Text="TCode Report" OnClick="btnTCodeReport_Click" />
                <asp:Button ID="btnReturntoMain" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" Width="75%" runat="server" Text="Return to Main Menu" OnClick="btnReturntoMain_Click" />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="pnlDates" CssClass="padding10" Visible="false" BackColor="Gold" runat="server">
            <div class="centerDiv backGold">
                <asp:Label ID="lblDateTitle" CssClass="inline" Font-Bold="true" BackColor="Gold" ForeColor="Maroon" Font-Size="2em" runat="server" Text=""></asp:Label>
            </div>

            <div class="centerDiv topMargin4em" style="background-color:gold;">
                <asp:Label ID="Label1" CssClass="inline" Font-Bold="true" BackColor="Gold" ForeColor="Maroon" Font-Size="2em" runat="server" Text="Start Date:"></asp:Label>
                <asp:TextBox ID="txtStartDate" CssClass="inline" Width="6em" Font-Bold="true" BackColor="Maroon" ForeColor="Gold" Font-Size="2em" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" CssClass="inline leftMargin2em" Font-Bold="true" BackColor="Gold" ForeColor="Maroon" Font-Size="2em" Text="End Date:"></asp:Label>
                <asp:TextBox ID="txtEndDate" CssClass="inline" Width="6em" Font-Bold="true" BackColor="Maroon" ForeColor="Gold" Font-Size="2em" runat="server"></asp:TextBox>
            </div>
                
            <asp:Panel ID="pnlErrMess" Visible="false" BackColor="Gold" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width50" style="background-color:gold;">
                    <asp:Label ID="lblErrMess" ForeColor="Red" Font-Size="2em" Font-Bold="true" BackColor="Gold" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>


            <div class="topMargin2em" style="background-color:gold;">
                <p class="pTitle autoMarginLeftRight width50 backgold centerText">Leave Dates Blank if no Date Criteria is needed.</p>
            </div>

            <hr class="myHr" />

            <div style="background-color:gold;">
                <asp:Button ID="btnRunReport" Width="23%" CssClass="autoMarginLeftRight block topMargin1em" Font-Size="2em" runat="server" Text="Run Report" OnClick="btnRunReport_Click" />
                <asp:Button ID="btnReturntoReportMenu" Width="23%" CssClass="autoMarginLeftRight block bottomMargin2em topMargin1em" Font-Size="2em" runat="server" Text=" Return to Report Menu " OnClick="btnReturntoReportMenu_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlTCodeReport" Visible="false" BackColor="White" runat="server" Style="padding-bottom:2em;">
            <asp:Button ID="btnTCodeReturn" CssClass="floatRight rightMargin2em" ForeColor="Maroon" runat="server" Text=" r " OnClick="btnReturntoPO_Click" />
            <div class="clear"></div>
            <p class="pTitle topMargin1em centerText backWhite" style="color:black;">TCode Report</p>
            <hr class="myHr" />

            <asp:Panel ID="pnlTCDateHeader" Visible="true" BackColor="White" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width50" style="background-color:white;">
                    <asp:Label ID="lblTCDateHeader" ForeColor="Black" Font-Size="2em" Font-Bold="true" BackColor="White" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

            <div class="centerDiv autoMarginLeftRight topMargin1em width95 maroonBorder" style="padding-bottom:2em;">
                <div class="floatLeft width45 backWhite centerDiv topMargin2em">
                   <asp:GridView ID="gvTCode_Totals1" CssClass="inline bottomMargin2em" BackColor="White" ForeColor="Black"  runat="server" AutoGenerateColumns="false">
                        <columns>
                        <asp:boundfield datafield="ID" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em"
                            headertext="ID" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        <asp:boundfield datafield="Code" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                            headertext="TCode" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        <asp:boundfield datafield="Total" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                            headertext="Totals" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        </columns>
                    </asp:GridView>
                </div>

                <div class="floatLeft width45 backWhite centerDiv topMargin2em leftMargin2em topMargin2em">
                    <asp:GridView ID="gvTCode_Totals2" CssClass="inline bottomMargin2em" BackColor="White" ForeColor="Black"  runat="server" AutoGenerateColumns="false">
                        <columns>
                            <asp:boundfield datafield="ID" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em"
                                headertext="ID" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Code" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="TCode" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Total" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="Totals" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        </columns>
                    </asp:GridView>
                </div>

                <div class="clear"></div>

                <div class="topMargin2em">
                    <asp:Label ID="lblTC_Grand" CssClass="inline" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlPOReport" Visible="false" BackColor="White" runat="server" Style="padding-bottom:2em;">
            <asp:Button ID="Button1" CssClass="floatRight rightMargin2em" ForeColor="Maroon" runat="server" Text=" r " OnClick="btnReturntoPO_Click" />
            <div class="clear"></div>
            <p class="pTitle topMargin1em centerText backWhite" style="color:black;">Purhase Order Report</p>
            <hr class="myHr" />

            <asp:Panel ID="pnlPODateHeader" Visible="true" BackColor="White" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width50" style="background-color:white;">
                    <asp:Label ID="lblPODateHeader" ForeColor="Black" Font-Size="2em" Font-Bold="true" BackColor="White" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

            <div class="centerDiv autoMarginLeftRight topMargin1em width95 maroonBorder" style="padding-bottom:2em;">
                <div class="autoMarginLeftRight width95 backWhite topMargin2em">
                    <asp:GridView ID="gvPOs1" CssClass="inline bottomMargin2em" BackColor="White" ForeColor="Black"  runat="server" AutoGenerateColumns="false">
                        <columns>
                            <asp:boundfield datafield="PONum" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em"
                                headertext="PONum" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Order_Date" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="Order Date" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Vendor" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="Vendor" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="TCode" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="TCode" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Total" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="Total Cost" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        </columns>
                    </asp:GridView>
                </div>

                <div class="clear"></div>

                <div class="topMargin2em">
                    <asp:Label ID="lblPO_Grand" CssClass="inline" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlTotalsReportArt" Visible="false" BackColor="White" runat="server" Style="padding-bottom:2em;">
            <asp:Button ID="btnReturntoPO" CssClass="floatRight rightMargin2em" ForeColor="Maroon" runat="server" Text=" r " OnClick="btnReturntoPO_Click" />
            <div class="clear"></div>
            <p class="pTitle topMargin1em centerText backWhite" style="color:black;">PO Totals Report</p>
            <hr class="myHr" />

            <asp:Panel ID="pnlDateHeader" Visible="true" BackColor="White" runat="server">
                <div class="autoMarginLeftRight topMargin2em centerDiv width50" style="background-color:white;">
                    <asp:Label ID="lblDateHeader" ForeColor="Black" Font-Size="2em" Font-Bold="true" BackColor="White" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

            <div class="centerDiv autoMarginLeftRight topMargin1em width95 maroonBorder" style="padding-bottom:2em;">
                <div class="floatLeft width45 backWhite centerDiv topMargin2em">
                   <asp:GridView ID="gvVendor_Totals1" CssClass="inline bottomMargin2em" BackColor="White" ForeColor="Black"  runat="server" AutoGenerateColumns="false">
                            <columns>
                                <asp:boundfield datafield="Vendor" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em"
                                   headertext="Vendor" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                                <asp:boundfield datafield="Cost" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                    headertext="Totals" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            </columns>
                        </asp:GridView>
                </div>

                <div class="floatLeft width45 backWhite centerDiv topMargin2em leftMargin2em topMargin2em">
                    <asp:GridView ID="gvVendor_Totals2" CssClass="inline bottomMargin2em" BackColor="White" ForeColor="Black"  runat="server" AutoGenerateColumns="false">
                        <columns>
                            <asp:boundfield datafield="Vendor" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em"
                                headertext="Vendor" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                            <asp:boundfield datafield="Cost" ItemStyle-BackColor="White" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="1.5em" 
                                headertext="Totals" HeaderStyle-BackColor="LightGray" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="1.5em"/>
                        </columns>
                    </asp:GridView>
                </div>

                <div class="clear"></div>

                <div class="topMargin2em">
                    <asp:Label ID="lblVendor_GrandTotal" CssClass="inline" Font-Bold="true" BackColor="White" ForeColor="Black" Font-Size="2em" runat="server" Text=""></asp:Label>
                </div>
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
