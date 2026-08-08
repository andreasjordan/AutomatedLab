function New-LWKickstartIso
{
    <#
        .SYNOPSIS
            Creates a small ISO image containing a kickstart file, labelled OEMDRV.

        .DESCRIPTION
            Anaconda automatically loads /ks.cfg from a volume labelled OEMDRV.
            AutomatedLab normally puts that label on a small FAT32 partition of the
            machine's system disk, which works for most RedHat derivatives.

            Anaconda on Oracle Linux 9 and later resolves the label with a disks-only
            lookup:

                LABEL=OEMDRV matches [] for devicetree=None and disks_only=True

            A partition can never satisfy that query, so the kickstart is ignored and the
            installation stops at the interactive welcome screen. An optical drive is a
            whole device and is matched, so shipping the same file on this ISO as well
            makes the unattended installation work there too.

            The image is built with the IMAPI2 COM API, so no external tooling such as
            oscdimg or mkisofs is required.

        .PARAMETER SourceFile
            The kickstart file to place in the root of the image. It is always stored as
            ks.cfg, which is the name anaconda looks for.

        .PARAMETER Path
            The full path of the ISO file to create. An existing file is replaced.

        .PARAMETER VolumeName
            The ISO9660 volume identifier, reported by blkid as LABEL. Defaults to OEMDRV.

        .EXAMPLE
            New-LWKickstartIso -SourceFile C:\Lab\ks_LinuxVm.cfg -Path C:\Lab\ks_LinuxVm.iso
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]$SourceFile,

        [Parameter(Mandatory)]
        [string]$Path,

        [string]$VolumeName = 'OEMDRV'
    )

    if (-not (Test-Path -Path $SourceFile))
    {
        throw "The kickstart file '$SourceFile' does not exist"
    }

    # IMAPI2 hands back the finished image as an IStream. Copying that to a file needs a
    # tiny bit of interop, defined once per session.
    if (-not ('AutomatedLab.IsoImageWriter' -as [type]))
    {
        Add-Type -TypeDefinition @'
namespace AutomatedLab
{
    using System;
    using System.IO;
    using System.Runtime.InteropServices;
    using System.Runtime.InteropServices.ComTypes;

    public static class IsoImageWriter
    {
        public static void Write(string path, object stream, int blockSize, int totalBlocks)
        {
            IStream source = (IStream)stream;

            using (FileStream target = File.Open(path, FileMode.Create, FileAccess.Write))
            {
                byte[] buffer = new byte[blockSize];
                IntPtr bytesRead = Marshal.AllocHGlobal(4);

                try
                {
                    while (totalBlocks-- > 0)
                    {
                        source.Read(buffer, blockSize, bytesRead);
                        int count = Marshal.ReadInt32(bytesRead);
                        if (count <= 0) { break; }
                        target.Write(buffer, 0, count);
                    }

                    target.Flush();
                }
                finally
                {
                    Marshal.FreeHGlobal(bytesRead);
                }
            }
        }
    }
}
'@
    }

    # IMAPI2 adds a directory tree, so stage the file in a folder of its own to make sure
    # nothing else ends up on the image.
    $stagingPath = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ([System.IO.Path]::GetRandomFileName())
    $null = New-Item -ItemType Directory -Path $stagingPath -Force

    try
    {
        Copy-Item -Path $SourceFile -Destination (Join-Path -Path $stagingPath -ChildPath ks.cfg) -Force

        $image = New-Object -ComObject IMAPI2FS.MsftFileSystemImage
        $image.FileSystemsToCreate = 3   # ISO9660 and Joliet
        $image.VolumeName = $VolumeName
        $image.Root.AddTree($stagingPath, $false)

        $result = $image.CreateResultImage()

        if (Test-Path -Path $Path) { Remove-Item -Path $Path -Force }
        [AutomatedLab.IsoImageWriter]::Write($Path, $result.ImageStream, $result.BlockSize, $result.TotalBlocks)

        Write-PSFMessage -Message "Created kickstart ISO '$Path' with volume name '$VolumeName'"

        Get-Item -Path $Path
    }
    finally
    {
        Remove-Item -Path $stagingPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}
