Public Class PurchaseOrders
    Inherits System.Web.UI.Page

    Sub FillPOList()
        Dim sql As String
        Dim ds As New DataSet

        sql = "EXEC Get_POs"
        Get_Dataset(sql, ds, "POs")

        lstPOs.DataSource = ds.Tables("POs")
        lstPOs.DataTextField = "PO"
        lstPOs.DataValueField = "PONum"
        lstPOs.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not LoggedIn Then
            Response.Redirect("Default.aspx")
        End If

        If SecurityLevel = 1 Then
            pnlReturn.Visible = False
        Else
            pnlReturn.Visible = True
        End If

        If Not IsPostBack Or RefreshPOList Then
            FillPOList()
            RefreshPOList = False
        End If
    End Sub

    Protected Sub lstPOs_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim sql As String
        Dim ds As New DataSet
        Dim r As DataRow
        Dim total As Double = 0

        sql = "Exec Get_MyPO '" & lstPOs.SelectedItem.Value + "'"

        Try
            Get_Dataset(sql, ds)
        Catch
            Exit Sub
        End Try

        lblPONum.Text = "PO Number: " + ds.Tables(0).Rows(0).Item("PONum")
        lblPrintPONum.Text = lblPONum.Text
        lblMemID.Text = "Member ID: " + ds.Tables(0).Rows(0).Item("MemberID")
        lblPrintMemID.Text = lblMemID.Text
        lblOrderDate.Text = "Order Date: " + ds.Tables(0).Rows(0).Item("Order_Date")
        lblPrintOrderDate.Text = lblOrderDate.Text
        lblTCode.Text = "TCode: " + ds.Tables(0).Rows(0).Item("TCode").ToString
        lblPrintTCode.Text = lblTCode.Text
        VendorID = ds.Tables(0).Rows(0).Item("Vendor")

        sql = "Exec Get_MyVendor " & VendorID

        Get_Dataset(sql, ds, "Vendors")

        lblVendorName.Text = ds.Tables("Vendors").Rows(0).Item("Name")
        lblPrintVendorName.Text = lblVendorName.Text
        lblVendorAddress.Text = ds.Tables("Vendors").Rows(0).Item("Address")
        lblPrintVendorAddress.Text = lblVendorAddress.Text
        lblVendorCity.Text = ds.Tables("Vendors").Rows(0).Item("City")
        lblPrintVendorCity.Text = lblVendorCity.Text
        lblVendorState.Text = ds.Tables("Vendors").Rows(0).Item("State")
        lblPrintVendorState.Text = lblVendorState.Text
        lblVendorZip.Text = ds.Tables("Vendors").Rows(0).Item("ZipCode")
        lblVendorPhone.Text = "Phone: " & UnFixPhone(ds.Tables("Vendors").Rows(0).Item("Phone"))
        lblPrintVendorPhone.Text = lblVendorPhone.Text
        lblVendorFax.Text = "Fax : " & UnFixPhone(ds.Tables("Vendors").Rows(0).Item("Fax"))
        lblPrintVendorFax.Text = lblVendorFax.Text
        lblVendorEMail.Text = "EMail: " & ds.Tables("Vendors").Rows(0).Item("EMail")
        lblPrintVendorEMail.Text = lblVendorEMail.Text

        sql = "Exec myPOItems '" & lstPOs.SelectedItem.Value & "'"

        Get_Dataset(sql, ds, "Items")

        For Each r In ds.Tables("Items").Rows
            total = total + r("C")
            r("Cost") = Format(r("C"), "Currency")
            r("Unit_Price") = Format(r("UP"), "Currency")
        Next

        lblTotalCost.Text = "Total Cost: " & Format(total, "C").ToString


        gvItems.DataSource = ds.Tables("Items")
        gvItems.DataBind()

        pnlDefault.Visible = False
        ShowPO.Visible = True

    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs)
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs)
        pnlMain.Visible = False
        pnlPrint.Visible = True
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
        pnlPOButs.Visible = False
        pnlMessage.Visible = True
        lblDeleteMess.Text = "Do you want to delete " & lstPOs.SelectedValue & "?"
    End Sub

    Protected Sub btnDeleteYes_Click(sender As Object, e As EventArgs)
        Dim sql As String = "Exec DeletePO '" & lstPOs.SelectedValue & "'"
        Dim myIndex As Int16

        myIndex = lstPOs.SelectedIndex
        Run_Sql(sql)
        FillPOList()

        Try
            lstPOs.SelectedIndex = myIndex
        Catch ex As Exception
            lstPOs.SelectedIndex = myIndex - 1
        End Try

        pnlPOButs.Visible = True
        pnlMessage.Visible = False

    End Sub

    Protected Sub btnDeleteNo_Click(sender As Object, e As EventArgs)
        pnlPOButs.Visible = True
        pnlMessage.Visible = False
    End Sub
End Class