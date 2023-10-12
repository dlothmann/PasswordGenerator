[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$PasswordGenerator = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$btn_generate = $null
[System.Windows.Forms.CheckBox]$chk_lower = $null
[System.Windows.Forms.CheckBox]$chk_digits = $null
[System.Windows.Forms.CheckBox]$chk_special = $null
[System.Windows.Forms.Button]$btn_clipboard = $null
[System.Windows.Forms.NumericUpDown]$numericUpDown1 = $null
[System.Windows.Forms.TextBox]$txt_Password = $null
[System.Windows.Forms.CheckBox]$chk_upper = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'PasswordGenerator.resources.ps1')
$btn_generate = (New-Object -TypeName System.Windows.Forms.Button)
$chk_upper = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chk_lower = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chk_digits = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chk_special = (New-Object -TypeName System.Windows.Forms.CheckBox)
$btn_clipboard = (New-Object -TypeName System.Windows.Forms.Button)
$txt_Password = (New-Object -TypeName System.Windows.Forms.TextBox)
$numericUpDown1 = (New-Object -TypeName System.Windows.Forms.NumericUpDown)
([System.ComponentModel.ISupportInitialize]$numericUpDown1).BeginInit()
$PasswordGenerator.SuspendLayout()
#
#btn_generate
#
$btn_generate.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$btn_generate.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btn_generate.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]344,[System.Int32]25))
$btn_generate.Name = [System.String]'btn_generate'
$btn_generate.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$btn_generate.TabIndex = [System.Int32]0
$btn_generate.Text = [System.String]'Generate'
$btn_generate.UseVisualStyleBackColor = $true
#
#chk_upper
#
$chk_upper.AutoSize = $true
$chk_upper.Checked = $true
$chk_upper.CheckState = [System.Windows.Forms.CheckState]::Checked
$chk_upper.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]24,[System.Int32]52))
$chk_upper.Name = [System.String]'chk_upper'
$chk_upper.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]87,[System.Int32]17))
$chk_upper.TabIndex = [System.Int32]1
$chk_upper.Text = [System.String]'Upper (A...Z)'
$chk_upper.UseVisualStyleBackColor = $true
$chk_upper.add_CheckedChanged($checkBox1_CheckedChanged)
#
#chk_lower
#
$chk_lower.AutoSize = $true
$chk_lower.Checked = $true
$chk_lower.CheckState = [System.Windows.Forms.CheckState]::Checked
$chk_lower.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]24,[System.Int32]75))
$chk_lower.Name = [System.String]'chk_lower'
$chk_lower.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]84,[System.Int32]17))
$chk_lower.TabIndex = [System.Int32]2
$chk_lower.Text = [System.String]'Lower (a...z)'
$chk_lower.UseVisualStyleBackColor = $true
$chk_lower.add_CheckedChanged($checkBox2_CheckedChanged)
#
#chk_digits
#
$chk_digits.AutoSize = $true
$chk_digits.Checked = $true
$chk_digits.CheckState = [System.Windows.Forms.CheckState]::Checked
$chk_digits.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]117,[System.Int32]52))
$chk_digits.Name = [System.String]'chk_digits'
$chk_digits.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]82,[System.Int32]17))
$chk_digits.TabIndex = [System.Int32]3
$chk_digits.Text = [System.String]'Digits (0...9)'
$chk_digits.UseVisualStyleBackColor = $true
#
#chk_special
#
$chk_special.AutoSize = $true
$chk_special.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]117,[System.Int32]75))
$chk_special.Name = [System.String]'chk_special'
$chk_special.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]119,[System.Int32]17))
$chk_special.TabIndex = [System.Int32]4
$chk_special.Text = [System.String]'Special (!,",§,$,%...)'
$chk_special.UseVisualStyleBackColor = $true
#
#btn_clipboard
#
$btn_clipboard.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$btn_clipboard.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btn_clipboard.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]344,[System.Int32]54))
$btn_clipboard.Name = [System.String]'btn_clipboard'
$btn_clipboard.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$btn_clipboard.TabIndex = [System.Int32]5
$btn_clipboard.Text = [System.String]'Clipboard'
$btn_clipboard.UseVisualStyleBackColor = $true
#
#txt_Password
#
$txt_Password.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]24,[System.Int32]25))
$txt_Password.Name = [System.String]'txt_Password'
$txt_Password.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]314,[System.Int32]20))
$txt_Password.TabIndex = [System.Int32]6
#
#numericUpDown1
#
$numericUpDown1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]291,[System.Int32]52))
$numericUpDown1.Minimum = [System.Int32]1
$numericUpDown1.Name = [System.String]'numericUpDown1'
$numericUpDown1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]47,[System.Int32]20))
$numericUpDown1.TabIndex = [System.Int32]7
$numericUpDown1.Value = [System.Int32]12
#
#PasswordGenerator
#
$PasswordGenerator.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]434,[System.Int32]121))
$PasswordGenerator.Controls.Add($numericUpDown1)
$PasswordGenerator.Controls.Add($txt_Password)
$PasswordGenerator.Controls.Add($btn_clipboard)
$PasswordGenerator.Controls.Add($chk_special)
$PasswordGenerator.Controls.Add($chk_digits)
$PasswordGenerator.Controls.Add($chk_lower)
$PasswordGenerator.Controls.Add($chk_upper)
$PasswordGenerator.Controls.Add($btn_generate)
$PasswordGenerator.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$PasswordGenerator.MaximizeBox = $false
$PasswordGenerator.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]450,[System.Int32]160))
$PasswordGenerator.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]450,[System.Int32]160))
$PasswordGenerator.Name = [System.String]'PasswordGenerator'
$PasswordGenerator.Text = [System.String]'PasswordGenerator'
([System.ComponentModel.ISupportInitialize]$numericUpDown1).EndInit()
$PasswordGenerator.ResumeLayout($false)
$PasswordGenerator.PerformLayout()
Add-Member -InputObject $PasswordGenerator -Name btn_generate -Value $btn_generate -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name chk_lower -Value $chk_lower -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name chk_digits -Value $chk_digits -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name chk_special -Value $chk_special -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name btn_clipboard -Value $btn_clipboard -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name numericUpDown1 -Value $numericUpDown1 -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name txt_Password -Value $txt_Password -MemberType NoteProperty
Add-Member -InputObject $PasswordGenerator -Name chk_upper -Value $chk_upper -MemberType NoteProperty
}
. InitializeComponent
