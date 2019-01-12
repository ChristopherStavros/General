Import-Module 'C:\Program Files\Microsoft Virtual Machine Converter\MvmcCmdlet.psd1'

$source = "C:\Users\chris\Downloads\kali-linux-2018-4-vm-amd64-7z\Kali-Linux-2018.4-vm-amd64\Kali-Linux-2018.4-vm-amd64.vmdk"
$dest = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
ConvertTo-MvmcVirtualHardDisk -SourceLiteralPath $source -VhdType DynamicHardDisk -VhdFormat vhdx -destination $dest