. (Join-Path $PSScriptRoot 'PasswordGenerator.designer.ps1')

$upper = @('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
$lower = @('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
$digits = @('0','1','2','3','4','5','6','7','8','9')
$special = @('!','"','[',']','$','%','&','(',')','=','?','*','+','#','-','_','.',',',':',';','<','>','@','^')
$pass = $null
$counter = 1


# .Net methods for hiding/showing the console in the background
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Show-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()

    # Hide = 0,
    # ShowNormal = 1,
    # ShowMinimized = 2,
    # ShowMaximized = 3,
    # Maximize = 3,
    # ShowNormalNoActivate = 4,
    # Show = 5,
    # Minimize = 6,
    # ShowMinNoActivate = 7,
    # ShowNoActivate = 8,
    # Restore = 9,
    # ShowDefault = 10,
    # ForceMinimized = 11

    [Console.Window]::ShowWindow($consolePtr, 4)
}

function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}

Hide-Console

$btn_generate.Add_Click({
	$bigfish = $null
	$length = $numericUpDown1.Value
	if($chk_upper.Checked){
		$bigfish = $bigfish + $upper
	}

	if($chk_lower.Checked){
		$bigfish = $bigfish + $lower
	}

	if($chk_digits.Checked){
		$bigfish = $bigfish + $digits
	}

	if($chk_special.Checked){
		$bigfish = $bigfish + $special
	}

	while($counter -le $length){

		$pass = $pass,($bigfish | Get-Random) -join ''
		
		$counter ++
	}

	$txt_Password.Text = $pass

})

$btn_clipboard.Add_Click({
	if($txt_Password.Text -ne ""){
		$txt_Password.SelectAll()
		$txt_Password.Copy()
	}
})



$PasswordGenerator.ShowDialog()