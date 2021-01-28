Public Class Users
    Inherits System.Web.UI.Page

    Sub GetUserList()
        Dim sql As String = "Exec GetUsers"
        Dim ds As New DataSet

        Get_Dataset(sql, ds)

        lstUsers.DataSource = ds.Tables(0)
        lstUsers.DataTextField = "Name"
        lstUsers.DataValueField = "ID"
        lstUsers.DataBind()
    End Sub

    Sub GetUserData()
        Dim sql As String
        Dim ds As New DataSet

        sql = "Exec GetUserData " & lstUsers.SelectedValue

        Get_Dataset(sql, ds)

        txtFirstName.Text = ds.Tables(0).Rows(0).Item("FirstName")
        txtLastName.Text = ds.Tables(0).Rows(0).Item("LastName")
        txtSecurity.Text = ds.Tables(0).Rows(0).Item("SecurityLevel")
        txtPassword.Text = ds.Tables(0).Rows(0).Item("Password")
        txtMembID.Text = ds.Tables(0).Rows(0).Item("MembID")

    End Sub

    Sub ClearBoxes()
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtSecurity.Text = ""
        txtPassword.Text = ""
        txtMembID.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetUserList()
        End If
    End Sub

    Protected Sub lstUsers_SelectedIndexChanged(sender As Object, e As EventArgs)
        pnlDefault.Visible = False
        pnlUserData.Visible = True

        mySaveIndex = lstUsers.SelectedIndex

        GetUserData()

        pnlSaveMess.Visible = False
        lstUsers.Enabled = True

    End Sub

    Protected Sub btnReturnMain_Click(sender As Object, e As EventArgs)
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim x As Int16
        Dim ds As New DataSet
        Dim UserName As String
        Dim indx As Int16

        UserName = Trim(txtLastName.Text) & ", " & Trim(txtFirstName.Text)


        sql = "Exec SaveUserChanges " & lstUsers.SelectedValue & ",'" & txtFirstName.Text & "','" &
            txtLastName.Text & "'," & txtSecurity.Text & ",'" & txtPassword.Text & "'," & txtMembID.Text

        Try
            Run_Sql(sql)

            lblSaveMess.Text = "Changes were saved."
            lblSaveMess.ForeColor = System.Drawing.Color.Maroon
            pnlSaveMess.Visible = True
        Catch ex As Exception
            lblSaveMess.Text = "NOTHING WAS SAVED."
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            pnlSaveMess.Visible = True
        End Try

        GetUserList()

        For x = 0 To lstUsers.Items.Count - 1
            lstUsers.SelectedIndex = x
            If lstUsers.SelectedItem.Text = UserName Then
                indx = x
                Exit For
            End If
        Next

        lstUsers.SelectedIndex = indx
        GetUserData()
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
        Dim mess As String

        mess = "Are you sure you want to delete " & txtLastName.Text & ", " & txtFirstName.Text
        lblDeleteMess.Text = mess
        pnlDeleteMess.Visible = True
    End Sub

    Protected Sub btnDeleteYes_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim myName As String
        Dim myIndex As Int16

        myName = txtLastName.Text & ", " & txtFirstName.Text
        myIndex = lstUsers.SelectedIndex

        sql = "Exec DeleteUser " & lstUsers.SelectedValue

        Try
            Run_Sql(sql)
            pnlDeleteMess.Visible = False
            lblSaveMess.ForeColor = System.Drawing.Color.Maroon
            lblSaveMess.Text = myName & " was deleted."
            pnlSaveMess.Visible = True
        Catch ex As Exception
            pnlDeleteMess.Visible = False
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = myName & " was NOT deleted."
            pnlSaveMess.Visible = True
        End Try

        GetUserList()

        Try
            lstUsers.SelectedIndex = myIndex
        Catch ex As Exception
            lstUsers.SelectedIndex = myIndex - 1
        End Try

        GetUserData()
    End Sub

    Protected Sub btnDeleteNo_Click(sender As Object, e As EventArgs)
        Dim mess As String

        mess = ""
        lblDeleteMess.Text = mess
        pnlDeleteMess.Visible = False
    End Sub

    Protected Sub btnSaveNewUser_Click(sender As Object, e As EventArgs)
        Dim sql As String
        Dim indx As Int16

        If Len(txtLastName.Text) = 0 Then
            pnlDeleteMess.Visible = False
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "A Last Name must be entered."
            pnlSaveMess.Visible = True
            Exit Sub
        End If

        If Len(txtFirstName.Text) = 0 Then
            pnlSaveMess.Visible = False
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = "A First Name must be entered."
            pnlSaveMess.Visible = True
            Exit Sub
        End If

        sql = "Exec AddNewUser '" & txtFirstName.Text & "','" &
            txtLastName.Text & "'," & txtSecurity.Text & ",'" & txtPassword.Text & "'," & txtMembID.Text

        Try
            Run_Sql(sql)
            lblSaveMess.ForeColor = System.Drawing.Color.Maroon
            lblSaveMess.Text = txtLastName.Text & ", " & txtFirstName.Text & " was added to the database."
            pnlSaveMess.Visible = True
        Catch ex As Exception
            lblSaveMess.ForeColor = System.Drawing.Color.Red
            lblSaveMess.Text = txtLastName.Text & ", " & txtFirstName.Text & " was NOT added to the database."
            pnlSaveMess.Visible = True
        End Try

        GetUserList()

        For x = 0 To lstUsers.Items.Count - 1
            lstUsers.SelectedIndex = x
            If lstUsers.SelectedItem.Text = txtLastName.Text & ", " & txtFirstName.Text Then
                indx = x
                Exit For
            End If
        Next

        lstUsers.SelectedIndex = indx

    End Sub
    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)

        If pnlDefault.Visible Then
            pnlDefault.Visible = False
            pnlUserData.Visible = True
        End If

        lblAddUser.Visible = True
        lblEditUser.Visible = False
        UserSaveChangesBut.Visible = False
        UserAddButs.Visible = True

        ClearBoxes()

        myIndex = lstUsers.SelectedIndex
        lstUsers.Enabled = False

    End Sub

    Protected Sub btnCancelNewUser_Click(sender As Object, e As EventArgs)

        If myIndex < 0 Then
            pnlDefault.Visible = True
            pnlUserData.Visible = False
        Else
            pnlDefault.Visible = False
            pnlUserData.Visible = True
        End If

        lstUsers.Enabled = True
        lstUsers.SelectedIndex = myIndex
        GetUserData()

        lblAddUser.Visible = False
        lblEditUser.Visible = True
        UserSaveChangesBut.Visible = True
        UserAddButs.Visible = False

        lstUsers.SelectedIndex = myIndex

        GetUserData()
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub
End Class