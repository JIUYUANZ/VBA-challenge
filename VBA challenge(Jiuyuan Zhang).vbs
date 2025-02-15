Attribute VB_Name = "Module1"
Sub VBA_challenge():

For Each ws In Worksheets

Dim Ticker_name As String
Dim Quarterly_change As Double
Dim Change_Ticker_Row As Integer
Dim Total_Volume As Double

Dim Quarterly_change_start As Double
Quarterly_change_start = ws.Cells(2, 3).Value

Dim Quarterly_change_close As Double

Change_Ticker_Row = 2

ws.Range("J1").Value = "Ticker"
ws.Range("K1").Value = "Quarterly Change"
ws.Range("L1").Value = "Percent Change"
ws.Range("M1").Value = "Total Stock Volume"

Lastrow = ws.Cells(Rows.Count, 1).End(xlUp).Row
For i = 2 To Lastrow

If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

Ticker_name = ws.Cells(i, 1).Value
Total_Volume = Total_Volume + ws.Cells(i, 7).Value

ws.Range("J" & Change_Ticker_Row).Value = Ticker_name
ws.Range("M" & Change_Ticker_Row).Value = Total_Volume

Quarterly_change_close = ws.Cells(i, 6).Value
Quarterly_change = Quarterly_change_close - Quarterly_change_start

ws.Range("K" & Change_Ticker_Row).Value = Quarterly_change
ws.Range("L" & Change_Ticker_Row).Value = Quarterly_change / Quarterly_change_start
ws.Range("L" & Change_Ticker_Row).NumberFormat = "0.00%"

Change_Ticker_Row = Change_Ticker_Row + 1
Quarterly_change_start = ws.Cells(i + 1, 3).Value

Total_Volume = 0

Else
Total_Volume = Total_Volume + ws.Cells(i, 7).Value

End If


If ws.Cells(i, 11) > 0 Then
 ws.Cells(i, 11).Interior.ColorIndex = 4
 ElseIf ws.Cells(i, 11) < 0 Then
 ws.Cells(i, 11).Interior.ColorIndex = 3
End If

ws.Range("P2").Value = "Greatest increase"
ws.Range("P3").Value = "Greatest decrease"
ws.Range("P4").Value = "Greatest total volume"
ws.Range("Q1").Value = "Ticker"
ws.Range("R1").Value = "Value"

Dim Greatest_Increase As Double
Dim Greatest_decrease As Double

Next i

ws.Columns("J:M").AutoFit

Next ws

End Sub

Sub maxmin()

For Each ws In Worksheets

    Dim Greatest_Increase As Double
    Dim Greatest_decrease As Double
    Dim Greatest_volume As Double
    Dim Ticker_increase As String
    Dim Ticker_decrease As String
    Dim Ticker_volume As String
    
    ws.Range("P2").Value = "Greatest increase"
    ws.Range("P3").Value = "Greatest decrease"
    ws.Range("P4").Value = "Greatest total volume"
    ws.Range("Q1").Value = "Ticker"
    ws.Range("R1").Value = "Value"
    
    Lastrow = ws.Cells(Rows.Count, 1).End(xlUp).Row
    
    Greatest_Increase = ws.Cells(2, 12).Value
    Greatest_decrease = ws.Cells(2, 12).Value
    Greatest_volume = ws.Cells(2, 13).Value
    Ticker_increase = ws.Cells(2, 10).Value
    Ticker_decrease = ws.Cells(2, 10).Value
    Ticker_volume = ws.Cells(2, 10).Value
    
    For j = 2 To Lastrow
        If ws.Cells(j, 12).Value > Greatest_Increase Then
            Greatest_Increase = ws.Cells(j, 12).Value
            Ticker_increase = ws.Cells(j, 10).Value
        End If
        
        If ws.Cells(j, 12).Value < Greatest_decrease Then
            Greatest_decrease = ws.Cells(j, 12).Value
            Ticker_decrease = ws.Cells(j, 10).Value
        End If
        
        If ws.Cells(j, 13).Value > Greatest_volume Then
            Greatest_volume = ws.Cells(j, 13).Value
            Ticker_volume = ws.Cells(j, 10).Value
        End If
    
    Next j
    
    ws.Range("R2").Value = Greatest_Increase
    ws.Range("R2").NumberFormat = "0.00%"
    
    ws.Range("R3").Value = Greatest_decrease
    ws.Range("R3").NumberFormat = "0.00%"
     
    ws.Range("R4").Value = Greatest_volume
    
    ws.Range("Q2").Value = Ticker_increase
    ws.Range("Q3").Value = Ticker_decrease
    ws.Range("Q4").Value = Ticker_volume

ws.Columns("P:R").AutoFit

Next ws


End Sub
