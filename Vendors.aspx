<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Vendors.aspx.vb" Inherits="BFD_New.Vendors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vendors</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=.2, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <link href="_Styles/Basic_Styles.css" rel="stylesheet" />
    <link href="_Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <p class="pTitle topMargin1em centerText">BFD Administration<br />Edit Vendors</p>
        <hr class="myHr" />
        <asp:HiddenField ID="myID" runat="server" />
        <aside class="floatLeft width20 topMargin1em yellowBorder">
            <asp:Label ID="Label1" CssClass="block centerDiv" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Vendors"></asp:Label>
            <asp:ListBox ID="lstVendors" Font-Size="Large" Width="95%" ForeColor="LightGray" CssClass="leftMargin1em topMargin1em" style="min-height:20em;max-height:20em;" runat="server" OnSelectedIndexChanged="lstVendors_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            
            <div class="centerDiv maroonBack">
                <asp:Button ID="btnAddNew" CssClass="topMargin1em autoMarginLeftRight" Visible="true" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Add New Vendor" OnClick="btnAddNew_Click" />
                <asp:Button ID="btnEdit" CssClass="topMargin1em autoMarginLeftRight" Visible="false" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Edit Vendors" OnClick="btnEdit_Click" />
                <asp:Button ID="btnReturnMain" CssClass="topMargin1em autoMarginLeftRight block topMargin1em" BackColor="Gold" Width="90%" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text="Return to Main Menu" OnClick="btnReturnMain_Click" />
            </div>
        </aside>

        <section class="floatLeft width70 topMargin1em leftMargin1em maroonBack yellowBorder" style="min-height:30em;">

            <asp:Panel ID="pnlDefault" runat="server">
                <p class="centerText fontSize2em topMargin3em bold block">Please select a Vendor from the Vendor List</p>
            </asp:Panel>

            <asp:Panel ID="vendorData" CssClass="maroonBack" Visible="false" runat="server">
                <div class="autoMarginLeftRight width50 maroonBack">
                    <asp:Label ID="lblEditVendor" CssClass="centerText leftMargin5em" Visible="true" Font-Size="2em" Font-Bold="true" runat="server" Text=" Edit/Show Vendor "></asp:Label>
                    <asp:Label ID="lblAddVendor" CssClass="centerText leftMargin5em" Visible="false" Font-Size="2em" Font-Bold="true" runat="server" Text=" Add New Vendor"></asp:Label>
                </div>
                    
                <div class="centerDiv topMargin3em maroonBack">
                    <asp:Label ID="Label2" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Vendor Name: "></asp:Label>
                    <asp:TextBox ID="txtVendorName" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="25em" BorderColor="Yellow" Font-Size="1.5em" runat="server" EnableTheming="True"></asp:TextBox>
                </div>

                <asp:Panel ID="pnlSaveMess" Visible="false" BackColor="Maroon" runat="server">
                    <div class="autoMarginLeftRight topMargin2em centerDiv width50 maroonBack">
                        <asp:Label ID="lblSaveMess" ForeColor="Maroon" Font-Size="2em" Font-Bold="true" BackColor="Moccasin" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>

                <div class="centerDiv topMargin2em maroonBack">
                    <asp:Label ID="Label3" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Address: "></asp:Label>
                    <asp:TextBox ID="txtAddress" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="25em" BorderColor="Yellow" Font-Size="1.5em" runat="server" EnableTheming="False"></asp:TextBox>
                </div>

                <div class="centerDiv topMargin2em maroonBack">
                    <asp:Label ID="Label4" Font-Size="1.5em" Font-Bold="true" runat="server" Text="City: "></asp:Label>
                    <asp:TextBox ID="txtCity" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" BorderColor="Yellow" Font-Size="1.5em" runat="server" EnableTheming="False"></asp:TextBox>
                    <asp:Label ID="Label5" Font-Size="1.5em" Font-Bold="true" CssClass="leftMargin2em" runat="server" Text="State: "></asp:Label>
                    <asp:TextBox ID="txtState" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="3em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                    <asp:Label ID="Label6" Font-Size="1.5em" Font-Bold="true" CssClass="leftMargin2em" runat="server" Text="Zip: "></asp:Label>
                    <asp:TextBox ID="txtZip" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="10em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
               </div>

                <div class="centerDiv topMargin2em maroonBack">
                    <asp:Label ID="Label7" Font-Size="1.5em" Font-Bold="true" runat="server" Text="Phone: "></asp:Label>
                    <asp:TextBox ID="txtPhone" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                    <asp:Label ID="Label8" Font-Size="1.5em" Font-Bold="true" CssClass="leftMargin2em" runat="server" Text="Fax: "></asp:Label>
                    <asp:TextBox ID="txtFax" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
               </div>

                <div id="myMail" class="centerDiv topMargin2em maroonBack">
                    <asp:Label ID="Label9" Font-Size="1.5em" runat="server" Text="EMail: "></asp:Label>
                    <asp:TextBox ID="txtEmail" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="25em" BorderColor="Yellow" Font-Size="1.5em" runat="server"></asp:TextBox>
                </div>

                <div class="maroonBack topMargin2em leftMargin1em bottomMargin2em">
                    <asp:Label ID="Label10" CssClass="block leftMargin1em" Font-Bold="true" Font-Size="1.5em" runat="server" Text="Comments: "></asp:Label>
                    <asp:TextBox ID="txtComments" CssClass="leftMargin1em padding5" BackColor="Gold" ForeColor="Maroon" Font-Bold="true" Width="90%" Height="3em" BorderColor="Yellow" Font-Size="1.5em" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

                <asp:Panel ID="VendorSaveChangesBut" Visible="true" CssClass="centerDiv maroonBack bottomMargin2em" runat="server">
                    <asp:Button ID="btnSave" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Save Changes " onclick="btnSave_Click" />
<%--                    <asp:Button ID="btnDeleteVendor" CssClass="leftMargin1em" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Delete Vendor " onclick="btnDeleteVendor_Click" />--%>
                </asp:Panel>

                <asp:Panel ID="VendorAddButs" Visible="false" CssClass="centerDiv maroonBack bottomMargin2em" runat="server">
                    <asp:Button ID="btnSaveNewVendor" CssClass="inline" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Save New Vendor " OnClick="btnSaveNewVendor_Click" />
                    <asp:Button ID="btnCancelNewVendor" CssClass="leftMargin2em inline" BackColor="Gold" Font-Bold="true" Font-Size="1.5em" ForeColor="Maroon" runat="server" Text=" Cancel Add " OnClick="btnCancelNewVendor_Click" />
                </asp:Panel>
            </asp:Panel>

        </section>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" Interval="60000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
