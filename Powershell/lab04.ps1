function computer{
Get-CIMInstance win32_computersystem | Select-Object Description
}
function os{
Get-CimInstance win32_operatingsystem | Select-Object Name
}
function processor{
Get-CimInstance Win32_Processor | Select-Object MaxClockSpeed,NumberOfCores,L*CacheSize;
}
function ram{
Get-CimInstance win32_physicalmemory | Select-Object Tag,Manufacturer,Description,Capacity,BankLabel,DeviceLocator | Format-Table -AutoSize Tag,Manufacturer,Description,Capacity,BankLabel,DeviceLocator
$total=(Get-CimInstance win32_physicalmemory | Measure-Object -Property capacity -sum).sum/1gb;echo "Total RAM is $total GB."
}
function network{
get-ciminstance win32_networkadapterconfiguration | Where-Object IPEnabled  | sort Index,IPAddress,IPSubnet,DNSDomain,DNSServerSearchOrder | Format-Table -autosize Description,Index,IPAddress,IPSubnet,DNSDomain,DNSServerSearchOrder
}

function drives{
$diskdrives = Get-CIMInstance CIM_diskdrive
  foreach ($disk in $diskdrives) {
new-object -typename psobject -property $([ordered]@{Manufacturer=$disk.Manufacturer
									Model=$disk.Model
                                                      "Size(GB)"=$disk.size / 1gb -as [int]})
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property $([ordered]@{
										   Drive=$logicaldisk.deviceid
                                                               "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                               "FreeSpace(GB)"=$logicaldisk.FreeSpace / 1gb -as [int]
                                                               "PercentFree(%)"=($logicaldisk.FreeSpace / 1gb -as [int]) / ($logicaldisk.size / 1gb -as [int]) * 100 -as [float]
                                                               }) | Format-Table -AutoSize
           }
      }
  }
}
function video{
$cards=Get-CimInstance win32_videocontroller
foreach ($card in $cards) {
new-object -typename psobject -property $([ordered]@{Name=$card.Name
									Description=$card.Description
                                                      "ScreenResolution(x*y)"=($card.CurrentHorizontalResolution -as [string])+"x"+($card.CurrentVerticalResolution -as [string])
})
}
}
get-date;
echo " "
echo "----- Showing Computer System Information -----"
echo "***********************************************"
computer
echo "----- Showing Operating System Information -----"
echo "************************************************"
os
echo "----- Showing Processor Information -----"
echo "*****************************************"
processor
echo "----- Showing RAM Information -----"
echo "***********************************"
ram
echo " "
echo "----- Showing Drive Information -----"
echo "***********************************"
echo " "
drives
echo " "
echo "----- Showing Network Information -----"
echo "***************************************"
network
echo "----- Showing Video Information -----"
echo "***************************************"
echo " "
video

