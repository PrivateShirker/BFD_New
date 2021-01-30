Imports System.Data.SqlClient

Module Module1
    Private cs As String = My.Settings.comString
    Public loading As Boolean = True
    Public LoggedIn As Boolean = False
    Public NumPOItems As Int16 = 5
    Public RefreshPOList As Boolean = False
    Public SecurityLevel As Integer
    Public MembID As Integer
    Public myIndex As Int16
    Public mySaveIndex As Int16
    Public myVendorID As Int16
    Public myVendorName As String
    Public vendIndex As Int16
    Public myPONum As String
    Public myTCode As String

    Public Sub Ping()
        'Note:   The Ping command does Not need "http://"
        My.Computer.Network.Ping("bfdadmin.com")
    End Sub

    Public Sub SayHello()
        MsgBox("Hello")
    End Sub

    Public Function NextPONum() As String
        Dim sql As String
        Dim ds As New DataSet
        Dim lastPO As String
        Dim x As Int16
        Dim y As Int16
        Dim thisDate As Date = Date.Now
        Dim thisYear As Integer
        Dim n As String = ""

        sql = "Exec GetLastPO"
        Get_Dataset(sql, ds)

        lastPO = ds.Tables(0).Rows(0).Item(0)

        x = CInt(Mid$(lastPO, 6, 3))
        y = CInt(Mid(lastPO, 1, 4))

        x = x + 1

        thisYear = Year(thisDate)

        If y <> CInt(thisYear) Then
            Return CInt(thisYear) & "-" & "001"
        End If

        If x < 10 Then
            n = "00" + x.ToString
        ElseIf n >= 10 And n < 100 Then
            n = "0" + x.ToString
        Else
            n = x.ToString
        End If

        Return thisYear.ToString + "-" + n
    End Function

    Public Sub Get_Dataset(ByVal sql As String, ByRef ds As DataSet, Optional ByVal SN As String = "Data")
        'Will return a dataset in accordance with the sql statement

        Dim cn As New SqlConnection
        Dim da As SqlDataAdapter

        cn.ConnectionString = cs
        cn.Open()
        da = New SqlDataAdapter(sql, cn)
        da.Fill(ds, SN)
        cn.Close()

    End Sub

    Public Sub Run_Sql(ByVal S As String)
        'Will run a sql statement with no return value
        Dim cmd As New SqlCommand
        Dim cn As New SqlConnection

        cn.ConnectionString = cs
        cn.Open()
        cmd.Connection = cn
        cmd.CommandType = CommandType.Text
        cmd.CommandText = S
        cmd.ExecuteNonQuery()
        cn.Close()

    End Sub

    Public Function FixPhone(s As String) As String
        Dim buffer As String = ""
        Dim x As Int16

        For x = 0 To Len(s) - 1
            If IsNumeric(s(x)) Then
                buffer &= s(x)
            End If
        Next

        Return buffer

    End Function

    Public Function UnFixPhone(ByVal s As String) As String
        If Not (Len(s) = 10 Or Not IsNumeric(s)) Then
            Return s
        Else
            If Len(s) = 10 Then
                Return "(" & Mid$(s, 1, 3) & ")" & Mid$(s, 4, 3) & "-" & Mid$(s, 7, 4)
            Else
                Return Mid$(s, 1, 3) & "-" & Mid$(s, 4, 4)
            End If

        End If
    End Function

    Public Function Capitolize(ByVal s As String) As String
        'This function will capitolize the first letters of each word in a string.
        'Works well with peoples names
        Dim x As Int32
        Dim temp As String

        s = unApos(s)

        temp = UCase(Mid$(s, 1, 1))

        For x = 2 To Len(s)
            If x = 3 And Mid$(s, x - 1, 1) = "'" Then
                temp &= UCase(Mid$(s, x, 1))
            Else
                If Mid$(s, x - 1, 1) = " " Then
                    temp &= UCase(Mid$(s, x, 1))
                ElseIf temp = "Mc" And x = 3 Then
                    temp &= UCase(Mid$(s, x, 1))
                ElseIf Mid$(s, x - 1, 1) = "(" Then
                    temp &= UCase(Mid$(s, x, 1))
                Else
                    temp &= LCase(Mid$(s, x, 1))
                End If
            End If

        Next

        Return temp

    End Function

    Public Function unApos(ByVal S As String) As String
        Dim strBuffer As String = ""
        Dim P As Int32

        If Len(S) = 0 Or IsNothing(S) Then
            Return ""
            Exit Function
        End If

        P = InStr(S, "''")

        If P = 0 Then
            Return S
            Exit Function
        End If

        strBuffer = Replace(S, "''", "'")

        Return strBuffer


    End Function

    Public Function Apos(ByVal S As String) As String
        'This function will check for apostrophies in a string and replace them with double apostrophies.
        Dim strBuffer As String = ""
        Dim P As Int32

        If Len(S) = 0 Or IsNothing(S) Then
            Return ""
            Exit Function
        End If

        P = InStr(S, "'")

        If P = 0 Then
            Return S
            Exit Function
        End If

        strBuffer = Replace(S, "'", "''")

        Return strBuffer

    End Function

End Module
