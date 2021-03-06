# ==============================================================================================
# 
# Microsoft PowerShell Source File
# 
# AUTHOR: Nerlens
# DATE  : Sometime in 2011
# 
# COMMENT: Compter Voice GUI
# 
# ==============================================================================================


##################################################################
# HIDE WINDOW
##################################################################
$script:showWindowAsync = Add-Type –memberDefinition @” 
[DllImport("user32.dll")] 
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); 
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru

function Show-PowerShell() { 
     $null = $showWindowAsync::ShowWindowAsync((Get-Process –id $pid).MainWindowHandle, 10) 
}

function Hide-PowerShell() { 
    $null = $showWindowAsync::ShowWindowAsync((Get-Process –id $pid).MainWindowHandle, 2) 
}

Hide-Powershell

##################################################################
# Speak!
##################################################################


function Out-Speech($text) {

    $speechy = New-Object –ComObject SAPI.SPVoice;
    $voices = $speechy.GetVoices();

    foreach ($voice in $voices) {
        if($voice.GetDescription() -eq $objListBox.SelectedItem ){
            $speechy.Voice = $voice;
        }
    }
    $speechy.Speak($text);
}

###############################
# GUI
###############################

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "Computer Voice"
$objForm.Size = New-Object System.Drawing.Size(300,300) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
#upon clicking enter the value in the textbox field is copied to $x
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;Out-Speech($x)}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

#ListBox label
$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,20) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Select voice:"
$objForm.Controls.Add($objLabel) 

######################################################################
#list box
$objListBox = New-Object System.Windows.Forms.ListBox 
$objListBox.Location = New-Object System.Drawing.Size(10,40) 
$objListBox.Size = New-Object System.Drawing.Size(260,20) 
$objListBox.Height = 80

######################
# Get- Voice List
######################

$speechy = New-Object –ComObject SAPI.SPVoice;
$voices = $speechy.GetVoices();

foreach ($voice in $voices) {
    $objListBox.Items.Add($voice.GetDescription());
}
#######################################################################


#textBox label
$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,140) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Please enter words for the computer voice:"
$objForm.Controls.Add($objLabel) 

#textbox
$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(10,160) 
$objTextBox.Size = New-Object System.Drawing.Size(260,60) 
$objTextBox.Multiline = $true
$objTextBox.ScrollBars = "Vertical";
$objForm.Controls.Add($objTextBox) 

#ok button
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,230)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.Add_Click({$x=$objTextBox.Text;Out-Speech($x)})
$objForm.Controls.Add($OKButton)

#cancel button
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,230)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

$objForm.Controls.Add($objListBox) 

$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()



