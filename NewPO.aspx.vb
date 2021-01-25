Public Class NewPO
    Inherits System.Web.UI.Page

    Sub ClearBoxes()
        lstVendors.SelectedIndex = -1
        lstTCodes.SelectedIndex = -1
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sql As String
        Dim ds As New DataSet

        If Not LoggedIn Then
            Response.Redirect("Default.aspx")
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
            lstVendors.SelectedIndex = -1

            txtPODate.Text = DateTime.Today
        End If
    End Sub

    Protected Sub btnReturnMenu_Click(sender As Object, e As EventArgs)
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub btnSavenAdd_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim x As Int16
        Dim OK As Boolean = False
        Dim newPONum As String

        If lstVendors.SelectedIndex < 0 Then
            MsgBox("A Vendor must be selected")
            Exit Sub
        End If

        If lstTCodes.SelectedIndex < 0 Then
            MsgBox("A TCode must be selected")
            Exit Sub
        End If

        If Len(txtPODate.Text) < 8 Then
            MsgBox("A PO Date must be entered.")
            Exit Sub
        End If

        If Not IsDate(txtPODate.Text) Then
            MsgBox("An invalid PO Date was entered.")
            Exit Sub
        End If

        newPONum = NextPONum()

        sql = "Exec SavePO '" & newPONum & "','" & txtPODate.Text & "'," & MembID & "," & lstVendors.SelectedValue & "," & lstTCodes.SelectedValue
        Run_Sql(sql)

        For x = 1 To NumPOItems
            If x = 1 Then
                If Len(txtItem1.Text) > 1 Then
                    If Not IsNumeric(txtQuantity1.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity1.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost1.Text) Then
                        MsgBox("An invalid Cost was entered")
                        txtCost1.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 2 Then
                If Len(txtItem2.Text) > 1 Then
                    If Not IsNumeric(txtQuantity2.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity2.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost2.Text) Then
                        MsgBox("An invalid Cost was entered")
                        txtCost2.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 3 Then
                If Len(txtItem3.Text) > 1 Then
                    If Not IsNumeric(txtQuantity3.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity3.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost3.Text) Then
                        MsgBox("An invalid Cost was entered")
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
                            MsgBox("An invalid Quantity was entered")
                            txtQuantity4.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost4.Text) Then
                            MsgBox("An invalid Cost was entered")
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
                            MsgBox("An invalid Quantity was entered")
                            txtQuantity5.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost5.Text) Then
                            MsgBox("An invalid Cost was entered")
                            txtCost5.Focus()
                            Exit Sub
                        End If

                        OK = True
                    End If
                End If
            End If
        Next

        If Not OK Then
            MsgBox("There are no items listed in this PO")
            Exit Sub
        End If


        If Not IsPostBack Then
            newPONum = NextPONum()
            sql = "EXEC SavePO '" + newPONum + "','" + txtPODate.Text + "'," + MembID + "," + lstVendors.SelectedValue + "," + lstTCodes.SelectedValue
            Run_Sql(sql)
        End If

        For x = 1 To 5
            If x = 1 Then
                If Len(txtItem1.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity1.Text & ",'" & txtItem1.Text & "'," & txtCost1.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem2.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity2.Text & ",'" & txtItem2.Text & "'," & txtCost2.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem3.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity3.Text & ",'" & txtItem3.Text & "'," & txtCost3.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem4.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity4.Text & ",'" & txtItem4.Text & "'," & txtCost4.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem5.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity5.Text & ",'" & txtItem5.Text & "'," & txtCost5.Text
                    Run_Sql(sql)
                End If
            End If
        Next

        RefreshPOList = True

        ClearBoxes()
    End Sub

    Protected Sub btnSavePO_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim x As Int16
        Dim OK As Boolean = False
        Dim newPONum As String

        If lstVendors.SelectedIndex < 0 Then
            MsgBox("A Vendor must be selected")
            Exit Sub
        End If

        If lstTCodes.SelectedIndex < 0 Then
            MsgBox("A TCode must be selected")
            Exit Sub
        End If

        If Len(txtPODate.Text) < 8 Then
            MsgBox("A PO Date must be entered.")
            Exit Sub
        End If

        If Not IsDate(txtPODate.Text) Then
            MsgBox("An invalid PO Date was entered.")
            Exit Sub
        End If

        newPONum = NextPONum()

        sql = "Exec SavePO '" & newPONum & "','" & txtPODate.Text & "'," & MembID & "," & lstVendors.SelectedValue & "," & lstTCodes.SelectedValue
        Run_Sql(sql)

        For x = 1 To NumPOItems
            If x = 1 Then
                If Len(txtItem1.Text) > 1 Then
                    If Not IsNumeric(txtQuantity1.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity1.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost1.Text) Then
                        MsgBox("An invalid Cost was entered")
                        txtCost1.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 2 Then
                If Len(txtItem2.Text) > 1 Then
                    If Not IsNumeric(txtQuantity2.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity2.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost2.Text) Then
                        MsgBox("An invalid Cost was entered")
                        txtCost2.Focus()
                        Exit Sub
                    End If

                    OK = True
                End If
            End If
            If x = 3 Then
                If Len(txtItem3.Text) > 1 Then
                    If Not IsNumeric(txtQuantity3.Text) Then
                        MsgBox("An invalid Quantity was entered")
                        txtQuantity3.Focus()
                        Exit Sub
                    End If

                    If Not IsNumeric(txtCost3.Text) Then
                        MsgBox("An invalid Cost was entered")
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
                            MsgBox("An invalid Quantity was entered")
                            txtQuantity4.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost4.Text) Then
                            MsgBox("An invalid Cost was entered")
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
                            MsgBox("An invalid Quantity was entered")
                            txtQuantity5.Focus()
                            Exit Sub
                        End If

                        If Not IsNumeric(txtCost5.Text) Then
                            MsgBox("An invalid Cost was entered")
                            txtCost5.Focus()
                            Exit Sub
                        End If

                        OK = True
                    End If
                End If
            End If
        Next

        If Not OK Then
            MsgBox("There are no items listed in this PO")
            Exit Sub
        End If


        If Not IsPostBack Then
            newPONum = NextPONum()
            sql = "EXEC SavePO '" + newPONum + "','" + txtPODate.Text + "'," + MembID + "," + lstVendors.SelectedValue + "," + lstTCodes.SelectedValue
            Run_Sql(sql)
        End If

        For x = 1 To 5
            If x = 1 Then
                If Len(txtItem1.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity1.Text & ",'" & txtItem1.Text & "'," & txtCost1.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem2.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity2.Text & ",'" & txtItem2.Text & "'," & txtCost2.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem3.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity3.Text & ",'" & txtItem3.Text & "'," & txtCost3.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem4.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity4.Text & ",'" & txtItem4.Text & "'," & txtCost4.Text
                    Run_Sql(sql)
                End If
                If Len(txtItem5.Text) > 5 Then
                    sql = "Exec AddPO_Item '" & newPONum & "'," & txtQuantity5.Text & ",'" & txtItem5.Text & "'," & txtCost5.Text
                    Run_Sql(sql)
                End If
            End If
        Next

        RefreshPOList = True

        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub

End Class