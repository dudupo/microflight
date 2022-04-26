[System.IO.Ports.SerialPort]::getportnames()
# $port= new-Object System.IO.Ports.SerialPort COM6
# $port.open()


# Write-Host "Select Serial Port"
# $portName = Read-Host -Prompt 'Input Serial Device Name'
# Write-Host "Using $portName..."

$port= new-Object System.IO.Ports.SerialPort COM6, 115200, None, 8, one
$port.open()

Write-Output $port

for(;;)
{
    if ($port.IsOpen)
    {
        $data = $port.ReadByte()
        Write-Output $data
    }
    else
    {
        Console.WriteLine("no")
    }
}