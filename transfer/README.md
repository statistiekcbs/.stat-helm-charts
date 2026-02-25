# transfer

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 17.1.0](https://img.shields.io/badge/AppVersion-17.1.0-informational?style=flat-square)

A Helm chart for the Dotstat transfer service.

This chart includes the transfer service application and supports external
Secrets as well as th use of probes form the HTTP endpoint

**Homepage:** <https://github.com/statistiekcbs/.stat-helm-charts>

## Source Code

* <https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| application.ApplyEmptyDataDbConnectionStringInMSDB | bool | `true` | Controls whether data db connection info should contain dummy value ("NOT_SAVED") for server, database, user name and password |
| application.AutoLog2Google.enabled | bool | `false` | Automatically log to google cloud |
| application.AutoLog2Google.logId | string | `"DOTSTAT_BACKEND"` | Google.Cloud logging logId |
| application.AutoLog2Google.logLevel | string | `"DEBUG"` | One of (DEBUG,INFO,ERROR) |
| application.AutoLog2Google.projectId | string | `nil` | Google.Cloud logging projectId, required if AutoLog2Google=true |
| application.AutoLog2Stdout.enabled | bool | `false` | Automatically log to standard output |
| application.AutoLog2Stdout.logLevel | string | `"DEBUG"` | Log level for standard output |
| application.DefaultLanguageCode | string | `nil` | Default language for localozed resources (transfer alert msgs.) ex. "en" |
| application.ExcelConfiguration.EPPlusLicense.Commercial | string | `""` | Provide if using commercial EPPlus license key. |
| application.ExcelConfiguration.EPPlusLicense.NonCommercialOrganization | string | `"sis-cc"` | Provide if using non-commercial organization EPPlus license. |
| application.ExcelConfiguration.EPPlusLicense.NonCommercialPersonal | string | `""` | Provide if using non-commercial personal EPPlus license. |
| application.ExcelConfiguration.ExcelFeaturesEnabled | bool | `true` | Master switch. If false, license isn’t applied and features are off. If ExcelFeaturesEnabled = true, at least one license field must be provided (non-empty) |
| application.ExcludeNonCodedDimensionsDuringConstraintCalculation | bool | `false` | Indicates if the transfer service should exclude the values found for non coded dimensions during the calculation of the actual content constraint. |
| application.HttpClientTimeOut | int | `120` | The timeout in seconds to wait before the http request times out |
| application.MaxConcurrentTransactions | int | `10` | The Maximum number of requests to be processed at the same time. When more requests are submited, the extra amount of requests are stored in a queue and process once the system is free. |
| application.MaxRequestBodySize | int | `30000000` | Maximum size of the imported files https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#changing-the-maximum-size-of-the-imported-files |
| application.MaxTransferErrorAmount | int | `0` | Maximum number of errors allowed before a transfer transaction stops |
| application.ServiceId | string | `nil` | A unique identifier for a transfer service instance. This is used to be able to cancel not properly closed requests, initiated by this instance of the application. When no value is provided, the transfer service will not try to do the cleanup at startup. |
| application.ShowAdvanceDbHealthInfo | bool | `true` | Specifies if the health page should dispaly extended database information about the data file sizes and connections |
| application.allowedContentType.edd | list | `[]` | List of allowed file content types for Edd files |
| application.allowedContentType.excel | list | `[]` | List of allowed file content types for Excel files |
| application.allowedContentType.sdmx | list | `[]` | List of allowed file content types for SDMX files |
| application.allowedFileExtensions.edd | list | `[]` | List of allowed file extensions for Edd files |
| application.allowedFileExtensions.excel | list | `[]` | List of allowed file extensions for Excel files |
| application.allowedFileExtensions.sdmx | list | `[]` | List of allowed file extensions for SDMX files |
| application.allowedFileExtensions.sdmxPath | list | `[]` | When the key is specified, only files with the allowed extensions can be read using the filepath parameter. |
| application.auth.allowAnonymous | bool | `true` |  |
| application.auth.authority | string | `""` | Authority url of token issuer |
| application.auth.authorizationUrl | string | `""` | Authorization url (used in swagger UI interface) |
| application.auth.claimsMapping | object | `{"email":"email","groups":"groups"}` | Key/value mapping of a key used in the C# code to JWT token claim. |
| application.auth.clientId | string | `""` | Client/application Id |
| application.auth.enabled | bool | `true` | Is openid authentication enabled |
| application.auth.requireHttps | bool | `false` | Is HTTPS connection to OpenId authority server required |
| application.auth.scopes | list | `[]` | Requested openId scopes (used as parameters for authorization url) |
| application.auth.showPii | bool | `false` |  |
| application.auth.tokenUrl | string | `nil` | Token url (used in swagger UI interface), optional, if not defined will be constructed based on authorizationUrl |
| application.auth.validateIssuer | bool | `false` | Is iss (issuer) claim in JWT token should match configured authority |
| application.commonDb.additionalParams | list | `[]` | Additional parameters for the connection string |
| application.commonDb.dbName | string | `""` | Database name |
| application.commonDb.serverHostname | string | `""` | Server URL |
| application.commonDb.serverPort | int | `1433` |  |
| application.commonDb.type | string | `"SqlServer"` | Database type |
| application.commonDb.userSecret.annotations | object | `{}` |  |
| application.commonDb.userSecret.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| application.commonDb.userSecret.name | string | `""` | Secret name for username and password |
| application.commonDb.userSecret.password.key | string | `""` | The password secret key |
| application.commonDb.userSecret.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| application.commonDb.userSecret.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| application.commonDb.userSecret.username.key | string | `""` | The username secret key |
| application.commonDb.userSecret.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| application.localizedResources | object | `{}` | List of localized resources, used to translate the alert/logging messages https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#localizedresources |
| application.smtp.HFrom | string | `nil` | Value for optional HFrom mail header in SMTP request |
| application.smtp.enableSsl | bool | `true` | SMTP enagle SSL to send user notifications |
| application.smtp.host | string | `nil` | SMTP host config. to send user notifications |
| application.smtp.mailFrom | string | `nil` | Email account from which the user notifications will be sent |
| application.smtp.port | string | `nil` | SMTP port config. to send user notifications |
| application.smtp.userSecret.annotations | object | `{}` |  |
| application.smtp.userSecret.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| application.smtp.userSecret.name | string | `""` | Secret name for username and password |
| application.smtp.userSecret.password.key | string | `""` | The password secret key |
| application.smtp.userSecret.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| application.smtp.userSecret.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| application.smtp.userSecret.username.key | string | `""` | The username secret key |
| application.smtp.userSecret.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| application.spacesInternal[0].AllowPITTargetDataVersion | bool | `true` | Specifies if access to Point-in-Time data should be allowed. If false, attempts to do so result in a 401 |
| application.spacesInternal[0].Archive | bool | `false` | Specifies if all the data and referential metadata stored in this dataspace should be archived (use COLUMNSTORE_ARCHIVE compression). |
| application.spacesInternal[0].DefaultPartitioningColumn | string | `""` | The partition column to be used to further optimize the tables for High Performance Reads (HPR) dataspaces |
| application.spacesInternal[0].DefaultPartitioningScheme | string | `""` | The partition scheme to be used to further optimize the tables for High Performance Reads (HPR) dataspaces |
| application.spacesInternal[0].KeepHistory | bool | `false` | Specifies if this dataspace should keep track of historical changes to the data values, for the use of the features 'asOf' and 'includeHistory' NB! Once the dataspace is configured with this setting and has some data imported it is not reversible, so one should decide whether historical data is needed or not for a given dataspace during the first setup. Enabling KeepHistory is not supported if you plan to use PIT release (setting targetVersion=1 when doing sdmx import). Also note that enabling this feature would require extra disk space on SQL server side to keep historical changes. |
| application.spacesInternal[0].MAXDOPForDsdOptimization | int | `0` | The Max Degree of Parallelism to be used while making the optimized table copies for High Performance Reads (HPR) dataspaces. |
| application.spacesInternal[0].NotifyImportBatchSize | int | `500000` | Specifies a size of a batch of observations processed, before notifying the amount of observations processed so far, and the batch number |
| application.spacesInternal[0].NotifyStillInProcessEveryMinutes | int | `5` | Notify that the transaction is still in progress every given minutes |
| application.spacesInternal[0].OptimizedForHighPerformanceReads | bool | `false` | Specifies if dataspace is configured as a High Performance Reads (HPR) dataspace. See more about optimization and table partitioning |
| application.spacesInternal[0].autoLog2Db.enabled | bool | `false` | Specifies if the log4net logging configuration should be generated automatically to log into the Data DB |
| application.spacesInternal[0].autoLog2Db.logLevel | string | `"NOTICE"` | Specifies the log4net log level applied by the auto-generated database logger |
| application.spacesInternal[0].data.additionalParams | list | `[]` | Additional parameters for all connection strings |
| application.spacesInternal[0].data.dbName | string | `""` | Database name |
| application.spacesInternal[0].data.serverHostname | string | `""` | Server URL |
| application.spacesInternal[0].data.serverPort | int | `1433` |  |
| application.spacesInternal[0].data.type | string | `"SqlServer"` | Database type |
| application.spacesInternal[0].data.userSecrets.reader | object | `{}` | Reader usecredentials. Same spec as writer user. Specifying this user will populate the DotStatSuiteCoreDataDbConnectionStringReadOnlyReplica parameter |
| application.spacesInternal[0].data.userSecrets.writer.additionalParams | list | `[]` | Additional parameters for writer connection string |
| application.spacesInternal[0].data.userSecrets.writer.annotations | object | `{}` |  |
| application.spacesInternal[0].data.userSecrets.writer.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| application.spacesInternal[0].data.userSecrets.writer.name | string | `""` | Secret name for username and password |
| application.spacesInternal[0].data.userSecrets.writer.password.key | string | `""` | The password secret key |
| application.spacesInternal[0].data.userSecrets.writer.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| application.spacesInternal[0].data.userSecrets.writer.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| application.spacesInternal[0].data.userSecrets.writer.username.key | string | `""` | The username secret key |
| application.spacesInternal[0].data.userSecrets.writer.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| application.spacesInternal[0].id | string | `nil` | Unique identifier for the space, ex. "design" |
| application.spacesInternal[0].structure.additionalParams | list | `[]` | Additional parameters for the connection string |
| application.spacesInternal[0].structure.dbName | string | `""` | Database name |
| application.spacesInternal[0].structure.serverHostname | string | `""` | Server URL |
| application.spacesInternal[0].structure.serverPort | int | `1433` |  |
| application.spacesInternal[0].structure.userSecret.annotations | object | `{}` |  |
| application.spacesInternal[0].structure.userSecret.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| application.spacesInternal[0].structure.userSecret.name | string | `""` | Secret name for username and password |
| application.spacesInternal[0].structure.userSecret.password.key | string | `""` | The password secret key |
| application.spacesInternal[0].structure.userSecret.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| application.spacesInternal[0].structure.userSecret.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| application.spacesInternal[0].structure.userSecret.username.key | string | `""` | The username secret key |
| application.spacesInternal[0].structure.userSecret.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| application.spacesInternal[0].timeouts.dataImport | string | `nil` | Max. time in minutes for an data import transaction |
| application.spacesInternal[0].timeouts.databaseCommand | string | `nil` | Max. time in seconds for a single command execution |
| application.tempFiles.directory | string | `"/app/temp"` | A path to an accessible directory to temporary store the imported files. The default value is the current user's temporary folder + '/TransferService' |
| application.tempFiles.maxAge | int | `24` | The maximum time in hours that an imported file, of a failed transaction, is stored in the TempFileDirectory. |
| application.tempFiles.minPercentageDiskSpace | int | `25` | The minimum allowed percentage of available disk space in the TempFileDirectory, before accepting any file upload request |
| application.tempFiles.volumeClaimTemplate.enabled | bool | `true` | Use a volumeClaimTemplate for the temp files. If disabled will mount an emptyDir |
| application.tempFiles.volumeClaimTemplate.retentionPolicy.whenDeleted | string | `"Retain"` | Sets the volumeclaim retention policy when the statefulset is deleted |
| application.tempFiles.volumeClaimTemplate.retentionPolicy.whenScaled | string | `"Retain"` | Sets the volumeclaim retention policy when the statefulset is scalled (down) |
| application.tempFiles.volumeClaimTemplate.size | string | `"15Gi"` | Set the size of the volume claim |
| archiveJob.annotations | object | `{}` |  |
| archiveJob.enabled | bool | `false` | Enables a cronJob to move files from the input volume to the archive volume |
| archiveJob.fileAge | int | `365` | Set the file age limit after which files are moved |
| archiveJob.image.pullPolicy | string | `"IfNotPresent"` |  |
| archiveJob.image.repository | string | `"busybox"` |  |
| archiveJob.image.tag | string | `"latest"` |  |
| archiveJob.podAnnotations | object | `{}` |  |
| archiveJob.resources | object | `{}` |  |
| archiveJob.schedule | string | `"@daily"` | Sets the schedule for the cronJob |
| archivePurgeJob.annotations | object | `{}` |  |
| archivePurgeJob.enabled | bool | `false` | Enables a cronJob to delete files from the archive volume |
| archivePurgeJob.fileAge | int | `1095` | Set the file age limit after which files are deleted from the archive volume |
| archivePurgeJob.image.pullPolicy | string | `"IfNotPresent"` |  |
| archivePurgeJob.image.repository | string | `"busybox"` |  |
| archivePurgeJob.image.tag | string | `"latest"` |  |
| archivePurgeJob.podAnnotations | object | `{}` |  |
| archivePurgeJob.resources | object | `{}` |  |
| archivePurgeJob.schedule | string | `"@daily"` | Sets the schedule for the cronJob |
| archiveVolume.persistentVolume.annotations | object | `{}` |  |
| archiveVolume.persistentVolume.capacity | string | `"5Gi"` | Capacity of the generated volume |
| archiveVolume.persistentVolume.driver | object | `{}` | Driver spec for the generated volume |
| archiveVolume.persistentVolume.mountOptions | list | `[]` | Mount options for the generated volume |
| archiveVolume.persistentVolume.name | string | `nil` | Name of the volume for the generated PVC. If not provided, the PV will  be generated |
| archiveVolume.persistentVolume.reclaimPolicy | string | `"Retain"` | Reclaim policy for the generated volume |
| archiveVolume.persistentVolume.storageClass | string | `nil` | Storage class of the generated volume |
| archiveVolume.persistentVolumeClaim.annotations | object | `{}` |  |
| archiveVolume.persistentVolumeClaim.name | string | `nil` | Name of the volume claim to mount. If not provided, the PVC will be generated |
| archiveVolume.persistentVolumeClaim.size | string | `"5Gi"` | Size of the generated PVC |
| archiveVolume.persistentVolumeClaim.storageClass | string | `nil` | Storage class of the generated PVC |
| archiveVolume.subPath | string | `""` | Set the path inside the archive volume where the files will be archived to |
| env | list | `[]` | Additional environment variables to be passed to the transfer service |
| fullnameOverride | string | `""` |  |
| httpRoute.additionalRules | list | `[]` | Defines addional rules |
| httpRoute.annotations | object | `{}` | Add annotations to the route |
| httpRoute.enabled | bool | `false` | enables the creation of an HTTPRoute |
| httpRoute.hostnames | list | `[]` | Hostnames to match the route |
| httpRoute.parentRefs | list | `[]` | A least one parentRef is required |
| httpRoute.serviceBackendFilters | list | `[]` | Defines filters for the default backend |
| httpRoute.serviceBackendMatches | list | `[{"path":{"type":"PathPrefix","value":"/"}}]` | Defines what the default service backend matches |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"siscc/dotstatsuite-core-transfer"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| inputVolume.mountPath | string | `"/input"` | Mount path inside the transfer container |
| inputVolume.persistentVolume.annotations | object | `{}` |  |
| inputVolume.persistentVolume.capacity | string | `"5Gi"` | Capacity of the generated volume |
| inputVolume.persistentVolume.driver | object | `{}` | Driver spec for the generated volume |
| inputVolume.persistentVolume.mountOptions | list | `[]` | Mount options for the generated volume |
| inputVolume.persistentVolume.name | string | `nil` | Name of the volume for the generated PVC. If not provided, the PV will  be generated |
| inputVolume.persistentVolume.reclaimPolicy | string | `"Retain"` | Reclaim policy for the generated volume |
| inputVolume.persistentVolume.storageClass | string | `nil` | Storage class of the generated volume |
| inputVolume.persistentVolumeClaim.annotations | object | `{}` |  |
| inputVolume.persistentVolumeClaim.name | string | `nil` | Name of the volume claim to mount. If not provided, the PVC will be generated |
| inputVolume.persistentVolumeClaim.size | string | `"5Gi"` | Size of the generated PVC |
| inputVolume.persistentVolumeClaim.storageClass | string | `nil` | Storage class of the generated PVC |
| inputVolume.subPath | string | `nil` | Set the path inside the input volume where the files will be findable inside the transfer container and they will be archived from |
| monitoring.collectionCount | int | `3` | The collectionCount is the amount of collections exposed at the metrics endpoint |
| monitoring.collectionInterval | int | `5` | The collectionInterval is the amount of seconds between 2 collection events |
| monitoring.enabled | bool | `false` | Enable monitoring by adding a dotnet monitoring side-car |
| monitoring.env | list | `[]` | Additional environment variables |
| monitoring.image.pullPolicy | string | `"IfNotPresent"` |  |
| monitoring.image.repository | string | `"mcr.microsoft.com/dotnet/monitor"` |  |
| monitoring.image.tag | string | `"6"` |  |
| monitoring.port | int | `52323` | Port number to listen to for metrics requests |
| monitoring.providers | list | `[{"ProviderName":"System.Runtime"},{"ProviderName":"Microsoft.AspNetCore.Hosting"},{"ProviderName":"Microsoft.AspNetCore.Http.Connections"},{"ProviderName":"Microsoft-AspNetCore-Server-Kestrel"},{"ProviderName":"System.Net.Http"}]` | Additional metrics providers and counter names https://github.com/dotnet/dotnet-monitor/blob/main/documentation/configuration/metrics-configuration.md#custom-metrics |
| monitoring.resources | object | `{}` |  |
| monitoring.securityContext | object | `{}` | Make sure the user for the main container and the monitoring side car are the same! |
| monitoring.serviceMonitor.enabled | bool | `false` |  |
| monitoring.volumeMounts | list | `[]` |  |
| nameOverride | string | `""` |  |
| networkPolicies.additionalIngressRules | list | `[]` |  |
| networkPolicies.egressRules | list | `[]` |  |
| networkPolicies.enableEgress | bool | `false` | Enable egress policies |
| networkPolicies.enableIngress | bool | `true` | Enable ingress network policies |
| networkPolicies.enabled | bool | `false` | Enables the deployment of network policies |
| networkPolicies.httpSelectors | list | `[]` | The list selectors allowed to acces the pod on the http port |
| networkPolicies.metricsSelectors | list | `[]` | The list selectors allowed to acces the pod on the metrics port |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probe.enabled | bool | `false` | Enables an HTTP probe |
| probe.extraLabels | object | `{}` | Additional labels to add to the probe and prometheus metric |
| probe.interval | string | `"30s"` | Probe interval |
| probe.module | string | `"http_2xx"` | Name of the module to use for probing |
| probe.probeLabel | string | `""` | Value of the "probe" label, defaults to the probe resource name |
| probe.proberPath | string | `"/probe"` | Path used by the prober |
| probe.proberUrl | string | `""` | URL of the prober (blackbox exporter) |
| probe.relabelings | list | `[]` | Metric relabeling |
| probe.selectorLabel | string | release: rancher-monitoring | Label to get picked up by the monitoring stack |
| probe.urls | list | `[]` | URLs to probe, usually the HTTPRoute or Ingress hostnames |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
