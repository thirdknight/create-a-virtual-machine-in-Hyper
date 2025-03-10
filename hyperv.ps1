New-VM -Name W10 -MemoryStartupBytes 8192MB -Generation 2 -SwitchName "External Network" -NoVHD
Set-Vm -Name W10 -ProcessorCount 4 -StaticMemory
New-VHd -Differencing -Path "C:\ISOs\W10.vhdx" -ParentPath "C:\ISOs\Base_Win10_Pro_21H2_Gen2.vhdx"
Add-VMHardDiskDrive -VMName W10 -Path "C:\ISOs\W10.vhdx" -ControllerType SCSI
$VMHardDiskDrive = Get-VMHardDiskDrive -VmName W10
Set-VmFirmware -VMName W10 -FirstBootDevice $VmHardDiskDrive
Start-Vm -Name W10
