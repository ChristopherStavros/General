[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$allMaterials = (Invoke-WebRequest -Uri https://tyler.caraza-harter.com/cs301/fall18/slides.html).links | Where-Object {$_.href -like "materials/lec*"} | Select-Object href, innerText

foreach($a in $allMaterials){
    $link =  $a.href
    $file = $a.href.replace("materials/", "")
    $extension = $file.substring($file.length -4)
    $fileName = $file.replace($extension, "")
    $name = $a.innerText.replace("[", "")
    $name = $name.replace("]", "")
    $name = $name.replace("Objects/", "")
    Write-Output $name
    Invoke-webrequest -URI https://tyler.caraza-harter.com/cs301/fall18/$link -OutFile "c:\temp\$fileName - $name$extension "
}
