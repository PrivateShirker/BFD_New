Public Class Main
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not LoggedIn Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub btnShowPOs_Click(sender As Object, e As EventArgs)
        Response.Redirect("PurchaseOrders.aspx")
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs)
        Dim sb As New StringBuilder

        sb.Append("<script>")
        sb.Append("$('.myArts').removeClass('block').addClass('noDisplay');")
        sb.Append("$('#Menu').removeClass('noDisplay').addClass('block');")
        sb.Append("$(document).attr('title', 'Main Menu');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString)
    End Sub

    Protected Sub btnNewPO_Click(sender As Object, e As EventArgs)
        Response.Redirect("NewPO.aspx")
    End Sub

    Protected Sub btnVendors_Click(sender As Object, e As EventArgs)
        Response.Redirect("Vendors.aspx")
    End Sub

    Protected Sub btnUsers_Click(sender As Object, e As EventArgs)
        Response.Redirect("Users.aspx")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs)
        Ping()
    End Sub
End Class