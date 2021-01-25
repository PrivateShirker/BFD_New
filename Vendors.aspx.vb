Public Class Vendors
    Inherits System.Web.UI.Page

    Sub getListData()
        Dim sql As String
        Dim ds As New DataSet

        sql = "EXEC VendorAllData " & lstVendors.SelectedValue

        Get_Dataset(sql, ds)

        myID.Value = ds.Tables(0).Rows(0).Item("ID")
        txtVendorName.Text = ds.Tables(0).Rows(0).Item("Name")
        txtAddress.Text = ds.Tables(0).Rows(0).Item("Address")
        txtCity.Text = ds.Tables(0).Rows(0).Item("City")
        txtState.Text = ds.Tables(0).Rows(0).Item("State")
        txtZip.Text = ds.Tables(0).Rows(0).Item("ZipCode")
        txtPhone.Text = UnFixPhone(ds.Tables(0).Rows(0).Item("Phone"))
        txtFax.Text = UnFixPhone(ds.Tables(0).Rows(0).Item("Fax"))
        txtEmail.Text = ds.Tables(0).Rows(0).Item("Email")
        txtComments.Text = ds.Tables(0).Rows(0).Item("Comments") + ""

    End Sub

    Sub Load_List()
        Dim sql As String
        Dim ds As New DataSet

        sql = "EXEC GetVendorNames"

        Get_Dataset(sql, ds)

        lstVendors.DataSource = ds.Tables(0)
        lstVendors.DataTextField = "Name"
        lstVendors.DataValueField = "ID"
        lstVendors.DataBind()
    End Sub

    Sub ClearVendorBoxes()
        txtVendorName.Text = ""
        txtAddress.Text = ""
        txtCity.Text = ""
        txtComments.Text = ""
        txtEmail.Text = ""
        txtFax.Text = ""
        txtPhone.Text = ""
        txtState.Text = ""
        txtVendorName.Text = ""
        txtZip.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Load_List()
            vendIndex = -1
        End If
    End Sub

    Protected Sub lstVendors_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim sb As New StringBuilder

        VendorSaveChangesBut.Visible = True

        vendorData.Visible = True
        pnlDefault.Visible = False

        getListData()

        vendIndex = lstVendors.SelectedIndex

        pnlSaveMess.Visible = False
    End Sub

    Protected Sub btnReturnMain_Click(sender As Object, e As EventArgs)
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim i As Int16

        i = lstVendors.SelectedIndex

        If Len(txtVendorName.Text) < 1 Then
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "A vendor Name must be entered."
            pnlSaveMess.Visible = True
            txtVendorName.Focus()
            'VendorSaveChangesBut.Visible = True
            Exit Sub
        Else
            pnlSaveMess.Visible = False
            'VendorSaveChangesBut.Visible = True
        End If

        sql = "Exec SaveVendorData " & myID.Value & ",'" & txtVendorName.Text & "','" & txtAddress.Text & "','" &
            txtCity.Text & "','" & txtState.Text & "','" & txtZip.Text & "','" & FixPhone(txtPhone.Text) &
            "','" & FixPhone(txtFax.Text) & "','" & txtEmail.Text & "','" & txtComments.Text & "'"

        Try
            Run_Sql(sql)
            lblSaveMess.ForeColor = System.Drawing.Color.Maroon
            lblSaveMess.Text = "Vendor changes were saved."
            pnlSaveMess.Visible = True
        Catch ex As Exception
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "Vendor changes were NOT saved."
            pnlSaveMess.Visible = True
        End Try

        Load_List()

        lstVendors.SelectedIndex = i
    End Sub

    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)
        ClearVendorBoxes()

        myIndex = lstVendors.SelectedIndex

        vendorData.Visible = True
        pnlDefault.Visible = False

        lblEditVendor.Visible = False
        lblAddVendor.Visible = True

        btnAddNew.Visible = False
        btnEdit.Visible = False

        pnlSaveMess.Visible = False

        VendorSaveChangesBut.Visible = False
        VendorAddButs.Visible = True

        lstVendors.Enabled = False

    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs)

        btnAddNew.Visible = True
        btnEdit.Visible = False
        lstVendors.Enabled = True
        lblAddVendor.Visible = False
        lblEditVendor.Visible = True
        pnlDefault.Visible = True
        vendorData.Visible = False
        VendorAddButs.Visible = False
        VendorSaveChangesBut.Visible = True

        lstVendors.SelectedIndex = myIndex

        If myIndex < 0 Then
            pnlDefault.Visible = True
            vendorData.Visible = False
        Else
            pnlDefault.Visible = False
            vendorData.Visible = True
            getListData()
        End If

    End Sub

    Protected Sub btnSaveNewVendor_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim x As Int16

        If Len(txtVendorName.Text) = 0 Then
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "A vendor Name must be entered."
            pnlSaveMess.Visible = True
            txtVendorName.Focus()
            Exit Sub
        End If

        pnlDefault.Visible = False
        vendorData.Visible = True
        lstVendors.SelectedIndex = -1
        lstVendors.Enabled = False
        lblAddVendor.Visible = True
        lblEditVendor.Visible = False

        btnAddNew.Visible = False
        btnEdit.Visible = True

        'okMess.Visible = False
        'errSaveMess.Visible = False
        'errMess.Visible = True

        VendorAddButs.Visible = True
        VendorSaveChangesBut.Visible = False

        sql = "Exec AddNewVendor '" & txtVendorName.Text & "','" & txtAddress.Text & "','" &
            txtCity.Text & "','" & txtState.Text & "','" & txtZip.Text & "','" & FixPhone(txtPhone.Text) &
            "','" & FixPhone(txtFax.Text) & "','" & txtEmail.Text & "','" & txtComments.Text & "'"

        Try
            Run_Sql(sql)
            lblSaveMess.ForeColor = System.Drawing.Color.Maroon
            lblSaveMess.Text = "New Vendor was added to Database."
            pnlSaveMess.Visible = True
        Catch ex As Exception
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "New Vendor was NOT added to Database."
            pnlSaveMess.Visible = True
        End Try

        Load_List()

        For x = 0 To lstVendors.Items.Count - 1
            If lstVendors.Items(x).Value = txtVendorName.Text Then
                lstVendors.SelectedIndex = x
                Exit For
            End If
        Next

    End Sub

    Protected Sub btnCancelNewVendor_Click(sender As Object, e As EventArgs)
        ClearVendorBoxes()
        btnAddNew.Visible = True
        btnEdit.Visible = False
        pnlSaveMess.Visible = False
        VendorAddButs.Visible = False
        lstVendors.Enabled = True

        If vendIndex < 0 Then
            pnlDefault.Visible = True
            vendorData.Visible = False
        Else
            pnlDefault.Visible = False
            vendorData.Visible = True
            lstVendors.Enabled = True
            lstVendors.SelectedIndex = vendIndex
            getListData()
            VendorSaveChangesBut.Visible = True
        End If

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub
End Class