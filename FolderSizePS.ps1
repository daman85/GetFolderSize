
Param(
[Parameter(Mandatory=$false,ValueFromPipeline=$true)]
$Path = ".\"
)

Process{

$folderList = Get-ChildItem -Path $path -Recurse -Directory |  Select-Object FullName

foreach ($P in $folderList) {
$Sum = Get-ChildItem $P.FullName -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum | Select-Object Sum


[PSCustomObject]@{
      "Path" = $P.FullName
      "Size($Units)" = [math]::Round(($Sum.Sum /1MB),2)
      }

    }
    
}

