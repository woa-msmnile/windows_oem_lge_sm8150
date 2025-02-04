# 获取当前目录
$currentDirectory = Get-Location

# 递归查找所有以 .inf 结尾的文件
$infFiles = Get-ChildItem -Path $currentDirectory -Recurse -Filter *.inf

# 输出相对路径并格式化
foreach ($file in $infFiles) {
    # 获取相对路径并去掉文件名部分
    $relativePath = $file.DirectoryName.Substring($currentDirectory.Path.Length + 1)
    $infFilename = $file.Name
    $infFilenameWithoutSuffix = [System.IO.Path]::GetFileNameWithoutExtension($infFilename)
    Write-Output "<DriverPackageFile Path=""`$(mspackageroot)\components\Devices\Alpha\$relativePath"" Name=""$infFilename"" ID=""$infFilenameWithoutSuffix""/>"
}