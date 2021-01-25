Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtPWD.Focus()
    End Sub

    Protected Sub butSubmit_Click(sender As Object, e As EventArgs)
        Dim ds As New DataSet
        Dim sql As String
        Dim UserName As String

        sql = "Exec CheckSecurity '" & txtPWD.Text & "'"
        Get_Dataset(sql, ds)

        If ds.Tables(0).Rows.Count < 1 Then
            pwdIncorrectMess.Visible = True
            LoggedIn = False
        Else
            LoggedIn = True
            SecurityLevel = ds.Tables(0).Rows(0).Item("SecurityLevel")
            UserName = ds.Tables(0).Rows(0).Item("FirstName") & " " & ds.Tables(0).Rows(0).Item("LastName")
            MembID = ds.Tables(0).Rows(0).Item("MembID")

            If SecurityLevel = 2 Then
                Response.Redirect("Main.aspx")
            Else
                Response.Redirect("PurchaseOrders.aspx")
            End If
        End If
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub
End Class