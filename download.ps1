Param(
  [string]$user,
  [string]$package
)

$user = $user.ToLower()
$package = $package.ToLower()

if(-Not (Test-Path "nuget.exe")) { Invoke-WebRequest -Uri "https://nuget.org/nuget.exe" -OutFile "nuget.exe" }
$version = [xml](Invoke-WebRequest -Uri "http://central.maven.org/maven2/com/github/$user/$package/maven-metadata.xml") |
            % { $_.metadata.versioning.latest }
$url = "http://central.maven.org/maven2/com/github/$user/$package/$version/$package-$version.aar"
Invoke-WebRequest -Uri $url -OutFile "Jars/package-release.aar"

$assemblyInfo = ".\Properties\AssemblyInfo.cs"
$tmp = "$assemblyInfo.tmp"
$newVersion = 'AssemblyVersion("' + $version + '")'
$newFileVersion = 'AssemblyFileVersion("' + $version + '")'

get-content $assemblyInfo |
    %{$_ -replace 'AssemblyVersion\(".*?"\)', $newVersion } |
    %{$_ -replace 'AssemblyFileVersion\(".*?"\)', $newFileVersion } > $tmp
move-item $tmp $assemblyInfo -force

$nuspecFile = "package.nuspec"
$xml = [xml](Get-Content $nuspecFile)
$xml.package.metadata.version = $version
$xml.Save((Resolve-Path "$nuspecFile").Path)