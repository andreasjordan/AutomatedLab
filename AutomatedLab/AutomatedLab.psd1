@{
    RootModule             = 'AutomatedLab.psm1'
    
    ModuleVersion          = '1.0.0'
	
    CompatiblePSEditions   = 'Core', 'Desktop'
    
    GUID                   = '6ee6d36f-7914-4bf6-9e3b-c0131669e808'
    
    Author                 = 'Raimund Andree, Per Pedersen, Jan-Hendrik Peters'
    
    CompanyName            = 'AutomatedLab Team'
    
    Copyright              = '2019'
    
    Description            = 'The module creates a Hyper-V visual lab automatically as defined in the XML files.'
    
    PowerShellVersion      = '5.1'
    
    DotNetFrameworkVersion = '4.0'
    
    CLRVersion             = '4.0'

    ModuleList             = @('AutomatedLab')
    
    ScriptsToProcess       = @('AutomatedLab.init.ps1')
    
    FormatsToProcess       = @('AutomatedLab.format.ps1xml')
    
    NestedModules          = @(
        'AutomatedLabAzureServices.psm1',
        'AutomatedLabADDS.psm1',
        'AutomatedLabADCS.psm1',
        'AutomatedLabADFS.psm1',
        'AutomatedLabDisks.psm1',
        'AutomatedLabInternals.psm1',
        'AutomatedLabVirtualMachines.psm1',
        'AutomatedLabSharePoint.psm1',
        'AutomatedLabSQL.psm1',
        'AutomatedLabNetwork.psm1',
        'AutomatedLabAzure.psm1',
        'AutomatedLabVMWare.psm1',
        'AutomatedLabRouting.psm1',
        'AutomatedLabDsc.psm1',
        'AutomatedLabOffice.psm1',
        'AutomatedLabHybrid.psm1',
        'AutomatedLabFailover.psm1',
        'AutomatedLabTfs.psm1',
        'AutomatedLabHyperV.psm1'
    )

    RequiredModules        = @(
        'AutomatedLabDefinition',
        'PSLog',
        'PSFileTransfer',
        'AutomatedLabWorker',
        'HostsFile',
        'AutomatedLabUnattended',
        'AutomatedLabNotifications',
        @{ModuleName='AutomatedLab.Common'; ModuleVersion='2.0.164'; }        
        'PSFramework'
    )

    CmdletsToExport        = @()
    
    FunctionsToExport      = @(
        'New-LabSourcesFolder',
        'Add-LabAzureSubscription',
        'Add-LabCertificate',
        'Add-LabVMUserRight',
        'Add-LabVMWareSettings',
        'Checkpoint-LabVM',
        'Clear-Lab',
        'Clear-LabCache',
        'Connect-Lab',
        'Connect-LabVM',
        'Disable-LabVMFirewallGroup',
        'Disconnect-Lab',
        'Dismount-LabIsoImage',
        'Enable-LabCertificateAutoenrollment',
        'Enable-LabHostRemoting',
        'Enable-LabVMFirewallGroup',
        'Enable-LabVMRemoting',
        'Enter-LabPSSession',
        'Export-Lab',
        'Get-Lab',
        'Get-LabAvailableOperatingSystem',
        'Get-LabAzureAppServicePlan',
        'Get-LabAzureCertificate',
        'Get-LabAzureDefaultLocation',
        'Get-LabAzureDefaultResourceGroup',
        'Get-LabAzureDefaultStorageAccount',
        'Get-LabAzureLabSourcesContent',
        'Get-LabAzureLabSourcesStorage',
        'Get-LabAzureLocation',
        'Get-LabAzureResourceGroup',
        'Get-LabAzureSubscription',
        'Get-LabAzureWebApp',
        'Get-LabAzureWebAppStatus',
        'Get-LabCertificate',
        'Get-LabHyperVAvailableMemory',
        'Get-LabInternetFile',
        'Get-LabIssuingCA',
        'Get-LabVMUacStatus',
        'Get-LabPSSession',
        'Get-LabSoftwarePackage',
        'Get-LabSourcesLocation',
        'Get-LabSourcesLocationInternal',
        'Get-LabVariable',
        'Get-LabVHDX',
        'Get-LabVM',
        'Get-LabVMDotNetFrameworkVersion',
        'Get-LabVMRdpFile',
        'Get-LabVMStatus',
        'Get-LabVMUptime',
        'Get-LabWindowsFeature',
        'Get-LabAvailableAzureSku',
        'Import-Lab',
        'Import-LabAzureCertificate',
        'Install-Lab',
        'Install-LabADDSTrust',
        'Install-LabAdfs',
        'Install-LabAdfsProxy',
        'Install-LabAzureServices',
        'Install-LabDcs',
        'Install-LabDnsForwarder',
        'Install-LabDscClient',
        'Install-LabDscPullServer',
        'Install-LabFailoverCluster',
        'Install-LabFirstChildDcs',
        'Install-LabOffice2013',
        'Install-LabOffice2016',
        'Install-LabRootDcs',
        'Install-LabRouting',
        'Install-LabSoftwarePackage',
        'Install-LabSoftwarePackages',
        'Install-LabSqlSampleDatabases',
        'Install-LabSqlServers',
        'Install-LabWindowsFeature',
        'Install-LabTeamFoundationEnvironment',
        'Install-LabHyperV',
        'Invoke-LabCommand',
        'Invoke-LabDscConfiguration',
        'Join-LabVMDomain',
        'Mount-LabIsoImage',
        'New-LabADSubnet',
        'New-LabAzureLabSourcesStorage',
        'New-LabAzureAppServicePlan',
        'New-LabAzureWebApp',
        'New-LabAzureRmResourceGroup',
        'New-LabCATemplate',
        'New-LabPSSession',
        'New-LabVHDX',
        'New-LabVM',
        'Remove-DeploymentFiles',
        'Remove-Lab',
        'Remove-LabAzureLabSourcesStorage',
        'Remove-LabAzureResourceGroup',
        'Remove-LabDscLocalConfigurationManagerConfiguration',
        'Remove-LabPSSession',
        'Remove-LabVariable',
        'Remove-LabVM',
        'Remove-LabVMSnapshot',
        'Request-LabCertificate',
        'Reset-AutomatedLab',
        'Restart-LabVM',
        'Restart-ServiceResilient',
        'Restore-LabConnection',
        'Restore-LabVMSnapshot',
        'Save-Hashes',
        'Save-LabVM',
        'Enable-LabAutoLogon',
        'Disable-LabAutoLogon',
        'Set-LabAzureDefaultLocation',
        'Set-LabAzureDefaultStorageAccount',
        'Set-LabAzureWebAppContent',
        'Set-LabDefaultOperatingSystem',
        'Set-LabDefaultVirtualizationEngine',
        'Set-LabDscLocalConfigurationManagerConfiguration',
        'Set-LabGlobalNamePrefix',
        'Set-LabInstallationCredential',
        'Set-LabVMUacStatus',
        'Show-LabDeploymentSummary',
        'Start-LabAzureWebApp',
        'Start-LabVM',
        'Stop-LabAzureWebApp',
        'Stop-LabVM',
        'Sync-LabActiveDirectory',
        'Sync-LabAzureLabSources',
        'Test-FileHashes',
        'Test-FileList',
        'Test-FolderExist',
        'Test-FolderNotExist',
        'Test-LabAutoLogon',
        'Test-LabAzureLabSourcesStorage',
        'Test-LabCATemplate',
        'Test-LabMachineInternetConnectivity',
        'Test-LabHostRemoting',
        'Test-LabPathIsOnLabAzureLabSourcesStorage',
        'Unblock-LabSources',
        'Undo-LabHostRemoting',
        'Uninstall-LabWindowsFeature'
        'Update-LabAzureSettings',
        'Update-LabIsoImage',
        'Update-LabBaseImage',
        'Update-LabSysinternalsTools',
        'Wait-LabADReady',
        'Wait-LabVM',
        'Wait-LabVMRestart',
        'Wait-LabVMShutdown',
        'Get-LabBuildStep',
        'Get-LabReleaseStep',
        'Get-LabCache',
        'New-LabReleasePipeline',
        'Get-LabAzureLoadBalancedPort',
        'Open-LabTfsSite'
        'Enable-LabTelemetry',
        'Disable-LabTelemetry',
        'Get-LabConfigurationItem',
        'Register-LabArgumentCompleters',
        'Get-LabVmSnapshot',
        'Test-LabHostConnected',
        'Test-LabAzureModuleAvailability',
        'Get-LWAzureAutoShutdown',
        'Enable-LWAzureAutoShutdown',
        'Disable-LWAzureAutoShutdown'
    )
    
    FileList               = @(
        'AutomatedLab.format.ps1xml',
        'AutomatedLab.init.ps1',
        'AutomatedLab.psd1', 
        'AutomatedLab.psm1',
        'AutomatedLabADCS.psm1',
        'AutomatedLabADDS.psm1',
        'AutomatedLabADFS.psm1',
        'AutomatedLabAzure.psm1',
        'AutomatedLabAzureServices.psm1',
        'AutomatedLabDisks.psm1',
        'AutomatedLabDsc.psm1',
        'AutomatedLabFailover.psm1',
        'AutomatedLabHybrid.psm1',
        'AutomatedLabInternals.psm1',
        'AutomatedLabNetwork.psm1',
        'AutomatedLabOffice.psm1',
        'AutomatedLabRouting.psm1',
        'AutomatedLabSharePoint.psm1',
        'AutomatedLabSQL.psm1',
        'AutomatedLabVirtualMachines.psm1',
        'AutomatedLabVMWare.psm1'
    )
}
