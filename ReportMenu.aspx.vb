Public Class ReportMenu
    Inherits System.Web.UI.Page
    Function GetPOTotals() As String
        Dim sql As String
        Dim ds As New DataSet

        sql = "exec getpototals '" & txtStartDate.Text & "','" & txtEndDate.Text & "'"
        Get_Dataset(sql, ds)

        Return Format(ds.Tables(0).Rows(0).Item(0).ToString, "Currency")
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not LoggedIn Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub btnVendor_Totals_Click(sender As Object, e As EventArgs)
        hfReport.Value = "Vendor Totals"
        lblDateTitle.Text = "Vendor Report Date Selection"
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        pnlDates.Visible = True
        pnlDates.Visible = True
        pnlMenuArt.Visible = False
    End Sub

    Protected Sub btnPOReport_Click(sender As Object, e As EventArgs)
        hfReport.Value = "PO Report"
        hfPOSort.Value = "PO Num"
        lblDateTitle.Text = "Purchase Order Report Date Selection"
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        pnlDates.Visible = True
        pnlMenuArt.Visible = False
    End Sub

    Protected Sub btnTCodeReport_Click(sender As Object, e As EventArgs)
        hfReport.Value = "TCode Report"
        hfPOSort.Value = "PO Num"
        lblDateTitle.Text = "TCode Report Date Selection"
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        pnlDates.Visible = True
        pnlMenuArt.Visible = False
    End Sub

    Protected Sub btnReturntoPO_Click(sender As Object, e As EventArgs)
        pnlTotalsReportArt.Visible = False
        pnlPOReport.Visible = False
        pnlTCodeReport.Visible = False
        pnlMenuArt.Visible = True
        pnlErrMess.Visible = False
    End Sub

    Protected Sub btnReturntoMain_Click(sender As Object, e As EventArgs)
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub btnReturntoReportMenu_Click(sender As Object, e As EventArgs)
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        pnlErrMess.Visible = False
        pnlDates.Visible = False
        pnlMenuArt.Visible = True
    End Sub

    Protected Sub btnRunReport_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim ds As New DataSet
        Dim r As DataRow

        Select Case hfReport.Value
            Case "TCode Report"
                'This will generate the TCode Report Tables
                sql = "Exec TCodeReport '" & txtStartDate.Text & "','" & txtEndDate.Text & "'"

                sql = "Select ID, Code, Total From TCodeReport1"

                Get_Dataset(sql, ds, "Table1")

                For Each r In ds.Tables("Table1").Rows
                    r("Total") = Format(r("Total"), "Currency")
                Next

                sql = "Select ID, Code, Total From TCodeReport2"

                Get_Dataset(sql, ds, "Table2")

                For Each r In ds.Tables("Table2").Rows
                    r("Total") = Format(r("Total"), "Currency")
                Next

                ds.AcceptChanges()

                gvTCode_Totals1.DataSource = ds.Tables("Table1")
                gvTCode_Totals1.DataBind()

                gvTCode_Totals2.DataSource = ds.Tables("Table2")
                gvTCode_Totals2.DataBind()

                If txtStartDate.Text = "" Then
                    lblTCDateHeader.Text = "No dates where entered - All Data is shown."
                Else
                    lblTCDateHeader.Text = "Dates between " & txtStartDate.Text & " and " & txtEndDate.Text
                End If

                lblTC_Grand.Text = "Grand Total: " & GetPOTotals()

                pnlTCodeReport.Visible = True
                pnlDates.Visible = False
            Case "Vendor Totals"
                If txtStartDate.Text <> "" Then
                    If Not IsDate(txtStartDate.Text) Then
                        lblErrMess.Text = "Invalid Start Date was entered"
                        pnlErrMess.Visible = True
                        txtStartDate.Focus()
                        Exit Sub
                    End If
                End If

                If txtEndDate.Text <> "" Then
                    If Not IsDate(txtEndDate.Text) Then
                        lblErrMess.Text = "Invalid End Date was entered"
                        pnlErrMess.Visible = True
                        txtEndDate.Focus()
                        Exit Sub
                    End If
                End If

                sql = "Exec GetVendorTotals '" & txtStartDate.Text & "','" & txtEndDate.Text & "'"

                Get_Dataset(sql, ds)

                sql = "Select * From VendorReport1"

                Get_Dataset(sql, ds, "Table1")

                sql = "Select * From VendorReport2"

                Get_Dataset(sql, ds, "Table2")


                gvVendor_Totals1.DataSource = ds.Tables("Table1")
                gvVendor_Totals1.DataBind()

                gvVendor_Totals2.DataSource = ds.Tables("Table2")
                gvVendor_Totals2.DataBind()

                lblDateHeader.Text = "No dates where entered - All Data is shown."
                lblVendor_GrandTotal.Text = "Grand Total: " & GetPOTotals()

                pnlTotalsReportArt.Visible = True
                pnlDates.Visible = False


                lblDateHeader.Text = "Dates between " & txtStartDate.Text & " and " & txtEndDate.Text
                lblVendor_GrandTotal.Text = "Grand Total: " & GetPOTotals()

                pnlTotalsReportArt.Visible = True
                pnlDates.Visible = False

            Case "PO Report"
                If txtStartDate.Text <> "" Then
                    If Not IsDate(txtStartDate.Text) Then
                        lblErrMess.Text = "Invalid Start Date was entered"
                        pnlErrMess.Visible = True
                        txtStartDate.Focus()
                        Exit Sub
                    End If
                End If

                If txtStartDate.Text <> "" Then
                    If Not IsDate(txtEndDate.Text) Then
                        lblErrMess.Text = "Invalid End Date was entered"
                        pnlErrMess.Visible = True
                        txtEndDate.Focus()
                        Exit Sub
                    End If
                End If

                sql = "Exec PO_Report '" & txtStartDate.Text & "','" & txtEndDate.Text & "'"

                Get_Dataset(sql, ds)

                sql = "Select * From POReport"

                Get_Dataset(sql, ds, "Table1")

                For Each r In ds.Tables("Table1").Rows
                    r("Total") = Format(r("Total"), "Currency")
                Next

                gvPOs1.DataSource = ds.Tables("Table1")
                gvPOs1.DataBind()

                If txtStartDate.Text = "" Then
                    lblPODateHeader.Text = "No dates where entered - All Data is shown."
                Else
                    lblPODateHeader.Text = "Dates between " & txtStartDate.Text & " and " & txtEndDate.Text
                End If

                lblPO_Grand.Text = "Grand Total: " & GetPOTotals()

                pnlPOReport.Visible = True
                pnlDates.Visible = False
        End Select
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Dim sql As String = "Exec Ghost"
        Dim ds As New DataSet
        Get_Dataset(sql, ds)
        lblGhost.Visible = False
    End Sub

End Class