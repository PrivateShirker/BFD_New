Public Class PurchaseOrders
    Inherits System.Web.UI.Page

    Dim OK As Boolean = False

    Sub ClearEditBoxes()
        txtQuantity1.Text = ""
        txtItem1.Text = ""
        txtCost1.Text = ""

        txtQuantity2.Text = ""
        txtItem2.Text = ""
        txtCost2.Text = ""

        txtQuantity3.Text = ""
        txtItem3.Text = ""
        txtCost3.Text = ""

        txtQuantity4.Text = ""
        txtItem4.Text = ""
        txtCost4.Text = ""

        txtQuantity5.Text = ""
        txtItem5.Text = ""
        txtCost5.Text = ""

    End Sub

    Sub FillPOForm()
        Dim sql As String
        Dim ds As New DataSet
        Dim r As DataRow
        Dim total As Double = 0
        Dim VendorID As Int16
        Dim myOrderDate As String
        Dim x As Int16 = 1

        myPONum = lstPOs.SelectedItem.Value

        sql = "Exec Get_MyPO '" & myPONum + "'"

        Try
            Get_Dataset(sql, ds)
        Catch
            Exit Sub
        End Try

        VendorID = ds.Tables(0).Rows(0).Item("Vendor")
        myTCode = ds.Tables(0).Rows(0).Item("TCode").ToString
        myOrderDate = ds.Tables(0).Rows(0).Item("Order_Date")

        lblPONum.Text = "PO Number: " + myPONum
        lblPrintPONum.Text = myPONum
        lblMemID.Text = "Member ID: " + ds.Tables(0).Rows(0).Item("MemberID")
        lblPrintMemID.Text = lblMemID.Text
        lblOrderDate.Text = "Order Date: " + myOrderDate
        lblPrintOrderDate.Text = lblOrderDate.Text
        lblTCode.Text = "TCode: " + myTCode
        lblPrintTCode.Text = lblTCode.Text

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

        lstVendors.SelectedValue = VendorID
        lstTCodes.SelectedValue = myTCode
        txtPODate.Text = myOrderDate

        ClearEditBoxes()

        sql = "Exec myPOItems '" & lstPOs.SelectedItem.Value & "'"

        Get_Dataset(sql, ds, "Items")

        For Each r In ds.Tables("Items").Rows
            Select Case x
                Case 1
                    txtQuantity1.Text = r("Quantity")
                    txtItem1.Text = r("Item")
                    txtCost1.Text = Format(r("UP"), "##.##")
                Case 2
                    txtQuantity2.Text = r("Quantity")
                    txtItem2.Text = r("Item")
                    txtCost2.Text = Format(r("UP"), "##.##")
                Case 3
                    txtQuantity3.Text = r("Quantity")
                    txtItem3.Text = r("Item")
                    txtCost3.Text = Format(r("UP"), "##.##")
                Case 4
                    txtQuantity4.Text = r("Quantity")
                    txtItem4.Text = r("Item")
                    txtCost4.Text = Format(r("UP"), "##.##")
                Case 5
                    txtQuantity5.Text = r("Quantity")
                    txtItem5.Text = r("Item")
                    txtCost5.Text = Format(r("UP"), "##.##")
            End Select

            x += 1

            total = total + r("C")
            r("Cost") = Format(r("C"), "Currency")
            r("Unit_Price") = Format(r("UP"), "Currency")
        Next

        lblTotalCost.Text = "Total Cost: " & Format(total, "C").ToString
        lblPrintTotalCost.Text = "Total Cost: " & Format(total, "C").ToString


        gvItems.DataSource = ds.Tables("Items")
        gvItems.DataBind()

        gvPrintItems.DataSource = ds.Tables("Items")
        gvPrintItems.DataBind()


    End Sub

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
        Dim sql As String
        Dim ds As New DataSet

        If Not LoggedIn Then
            Response.Redirect("Default.aspx")
        End If

        If SecurityLevel = 1 Then
            pnlReturn.Visible = False
            btnEdit.Visible = False
            btnDelete.Visible = False
        Else
            pnlReturn.Visible = True
            btnEdit.Visible = True
            btnDelete.Visible = True
        End If

        If Not IsPostBack Then
            sql = "EXEC GetVendorList"
            Get_Dataset(sql, ds, "Vendors")

            lstVendors.DataSource = ds.Tables("Vendors")
            lstVendors.DataTextField = "Name"
            lstVendors.DataValueField = "ID"
            lstVendors.DataBind()

            sql = "EXEC GetTCodeList"
            Get_Dataset(sql, ds, "TCodes")

            lstTCodes.DataSource = ds.Tables("TCodes")
            lstTCodes.DataTextField = "Code"
            lstTCodes.DataValueField = "ID"
            lstTCodes.DataBind()

            lstVendors.SelectedIndex = -1
            lstTCodes.SelectedIndex = -1
        End If

        If Not IsPostBack Or RefreshPOList Then
            FillPOList()
            RefreshPOList = False
        End If
    End Sub

    Protected Sub lstPOs_SelectedIndexChanged(sender As Object, e As EventArgs)

        myPONum = lstPOs.SelectedValue

        FillPOForm()

        pnlDefault.Visible = False
        pnlShowPO.Visible = True

        pnlPOButs.Visible = True
        pnlMessage.Visible = False
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
        Dim sql As String
        Dim myIndex As Int16

        myIndex = lstPOs.SelectedIndex

        sql = "Exec DeletePO '" & lstPOs.SelectedValue & "'"

        Run_Sql(sql)
        FillPOList()

        Try
            lstPOs.SelectedIndex = myIndex
        Catch ex As Exception
            lstPOs.SelectedIndex = myIndex - 1
        End Try

        FillPOForm()

        pnlPOButs.Visible = True
        pnlMessage.Visible = False

    End Sub

    Protected Sub btnDeleteNo_Click(sender As Object, e As EventArgs)
        pnlPOButs.Visible = True
        pnlMessage.Visible = False
    End Sub

    Protected Sub btnReturntoPO_Click(sender As Object, e As EventArgs)
        pnlMain.Visible = True
        pnlPrint.Visible = False
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs)
        pnlEditPO.Visible = True
        pnlPoDefault.Visible = False
        lblEditPONum.Text = "Edit PO Number: " & myPONum
    End Sub

    Protected Sub btnEditCancel_Click(sender As Object, e As EventArgs)
        pnlEditPO.Visible = False
        pnlPoDefault.Visible = True
    End Sub

    Protected Sub btnEditSave_Click(sender As Object, e As EventArgs)
        Dim x As Integer
        Dim sql As String
        Dim ds As New DataSet
        Dim myPONum As String
        Dim total As Double = 0

        If Len(txtPODate.Text) < 8 Then
            MsgBox("A PO Date must be entered.")
            Exit Sub
        End If

        If Not IsDate(txtPODate.Text) Then
            MsgBox("An invalid PO Date was entered.")
            Exit Sub
        End If

        myPONum = lstPOs.SelectedValue

        For x = 1 To NumPOItems
            If x = 1 Then
                If Len(txtItem1.Text) > 1 Then
                    If Not IsNumeric(txtQuantity1.Text) Then
                        MsgBox("An invalid Quantity was entered in Item1.")
                        txtQuantity1.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost1.Text) Then
                        MsgBox("An invalid Cost was entered in Item1.")
                        txtCost1.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 2 Then
                If Len(txtItem2.Text) > 1 Then
                    If Not IsNumeric(txtQuantity2.Text) Then
                        MsgBox("An invalid Quantity was entered in Item2.")
                        txtQuantity2.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost2.Text) Then
                        MsgBox("An invalid Cost was entered in Item2.")
                        txtCost2.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 3 Then
                If Len(txtItem3.Text) > 1 Then
                    If Not IsNumeric(txtQuantity3.Text) Then
                        MsgBox("An invalid Quantity was entered in Item3.")
                        txtQuantity3.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost3.Text) Then
                        MsgBox("An invalid Cost was entered in Item3.")
                        txtCost3.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 4 Then
                If Len(txtItem4.Text) > 1 Then
                    If Len(txtItem4.Text) > 1 Then
                        If Not IsNumeric(txtQuantity4.Text) Then
                            MsgBox("An invalid Quantity was entered in Item4.")
                            txtQuantity4.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost4.Text) Then
                            MsgBox("An invalid Cost was entered in Item4.")
                            txtCost4.Focus()
                            Exit Sub
                        End If

                        OK = True
                    End If
                End If
            End If
            If x = 5 Then
                If Len(txtItem5.Text) > 1 Then
                    If Len(txtItem5.Text) > 1 Then
                        If Not IsNumeric(txtQuantity5.Text) Then
                            MsgBox("An invalid Quantity was entered in Item5.")
                            txtQuantity5.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost5.Text) Then
                            MsgBox("An invalid Cost was entered in Item5.")
                            txtCost5.Focus()
                            Exit Sub
                        End If

                        OK = True
                    End If
                End If
            End If
        Next

        sql = "Exec SavePOEdit '" & myPONum & "','" & txtPODate.Text & "'," & lstVendors.SelectedValue & "," & lstTCodes.SelectedValue
        Try
            Run_Sql(sql)
        Catch
            MsgBox("PO was not saved.")
            Exit Sub
        End Try

        For x = 1 To 5
            If x = 1 Then
                If Len(txtItem1.Text) > 1 Then
                    sql = "Exec AddPO_Item '" & myPONum & "'," & txtQuantity1.Text & ",'" & txtItem1.Text & "'," & txtCost1.Text
                    Try
                        Run_Sql(sql)
                    Catch
                        MsgBox("Item #1 was not saved.")
                        Exit Sub
                    End Try
                End If
                If Len(txtItem2.Text) > 1 Then
                    sql = "Exec AddPO_Item '" & myPONum & "'," & txtQuantity2.Text & ",'" & txtItem2.Text & "'," & txtCost2.Text
                    Try
                        Run_Sql(sql)
                    Catch
                        MsgBox("Item #2 was not saved.")
                        Exit Sub
                    End Try
                End If
                If Len(txtItem3.Text) > 1 Then
                    sql = "Exec AddPO_Item '" & myPONum & "'," & txtQuantity3.Text & ",'" & txtItem3.Text & "'," & txtCost3.Text
                    Try
                        Run_Sql(sql)
                    Catch
                        MsgBox("Item #3 was not saved.")
                        Exit Sub
                    End Try
                End If
                If Len(txtItem4.Text) > 1 Then
                    sql = "Exec AddPO_Item '" & myPONum & "'," & txtQuantity4.Text & ",'" & txtItem4.Text & "'," & txtCost4.Text
                    Try
                        Run_Sql(sql)
                    Catch
                        MsgBox("Item #4 was not saved.")
                        Exit Sub
                    End Try
                End If
                If Len(txtItem5.Text) > 1 Then
                    sql = "Exec AddPO_Item '" & myPONum & "'," & txtQuantity5.Text & ",'" & txtItem5.Text & "'," & txtCost5.Text
                    Try
                        Run_Sql(sql)
                    Catch
                        MsgBox("Item #5 was not saved.")
                        Exit Sub
                    End Try
                End If
            End If
        Next

        sql = "Exec myPOItems '" & lstPOs.SelectedItem.Value & "'"

        Get_Dataset(sql, ds, "Items")

        For Each r In ds.Tables("Items").Rows
            Select Case x
                Case 1
                    txtQuantity1.Text = r("Quantity")
                    txtItem1.Text = r("Item")
                    txtCost1.Text = Format(r("UP"), "##.##")
                Case 2
                    txtQuantity2.Text = r("Quantity")
                    txtItem2.Text = r("Item")
                    txtCost2.Text = Format(r("UP"), "##.##")
                Case 3
                    txtQuantity3.Text = r("Quantity")
                    txtItem3.Text = r("Item")
                    txtCost3.Text = Format(r("UP"), "##.##")
                Case 4
                    txtQuantity4.Text = r("Quantity")
                    txtItem4.Text = r("Item")
                    txtCost4.Text = Format(r("UP"), "##.##")
                Case 5
                    txtQuantity5.Text = r("Quantity")
                    txtItem5.Text = r("Item")
                    txtCost5.Text = Format(r("UP"), "##.##")
            End Select

            x += 1

            total = total + r("C")
            r("Cost") = Format(r("C"), "Currency")
            r("Unit_Price") = Format(r("UP"), "Currency")
        Next

        lblTotalCost.Text = "Total Cost: " & Format(total, "C").ToString
        lblTCode.Text = "TCode: " & lstTCodes.SelectedValue

        gvItems.DataSource = ds.Tables("Items")
        gvItems.DataBind()

        pnlShowPO.Visible = True
        pnlPoDefault.Visible = True

        pnlEditPO.Visible = False
        pnlPrint.Visible = False

    End Sub
End Class