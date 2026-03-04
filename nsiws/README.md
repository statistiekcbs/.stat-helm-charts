# nsiws

![Version: 10.0.0](https://img.shields.io/badge/Version-10.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.11.2](https://img.shields.io/badge/AppVersion-10.11.2-informational?style=flat-square)

A Helm chart for the .Stat NSI web service.

This chart includes the ability to deploy the NSIWS application, the DBup
applications for data and structure databases and supports generating External
Secrets and monitoring probes for the application itself and the databases.

**Homepage:** <https://github.com/statistiekcbs/.stat-helm-charts>

## Source Code

* <https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/>
* <https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| application.allowDsdReferenceNonFinal | bool | `false` | Allow DSD imports to reference non-final items |
| application.allowLocalDataAsAnnotations | bool | `false` | Allow the ?annotations=localdata parameter in SDMX REST data queries. When this is enabled and the query parameter annotations=localdata is used then together with the data, annotations containing the mapping to the local data and columns will be included. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.AutoLog2Google | bool | `false` | Automatically log to google cloud. Default = false https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.GOOGLE_APPLICATION_CREDENTIALS | string | `""` | If the service is executed outside of Google Cloud Platform it is required to set this variable with a path to a service account JSON file for an authentication, see more here: https://cloud.google.com/dotnet/docs/reference/Google.Cloud.Logging.Log4Net/latest/#authentication https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.GoogleLogId | string | `"DOTSTAT_BACKEND"` | Google.Cloud logging logId. Default = DOTSTAT_BACKEND https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.GoogleLogLevel | string | `"DEBUG"` | One of (DEBUG,INFO,ERROR). Default = DEBUG https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.GoogleProjectId | bool | `true` | Google.Cloud logging projectId, required only if AutoLog2Google=true https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.applyContentConstraintsOnDataQueries | bool | `true` | Specifies if NSI WS should apply allowed content constraints at data retrieval. The default value for this docker image is true, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.authorization.ConnectTimeoutSeconds | int | `5` | The timespan to wait before the connection establishing times out. Default in .NET is infinite. |
| application.appSettings.authorization.MaxConnectionsPerServer | int | `100` | Maximum number of concurrent TCP connections HttpClient will open to the same downstream server. Default in .NET is int.MaxValue. |
| application.appSettings.authorization.PooledConnectionIdleTimeoutMinutes | int | `1` | The maximum idle time for a connection in the pool. Default in .NET is 1 minute. |
| application.appSettings.authorization.PooledConnectionLifetimeMinutes | int | `5` | The maximum time for a connection to be in the pool. Default in .NET is infinite. |
| application.appSettings.authorization.PrincipalFrom | string | `"context"` | The principal used at authorization should be taken from context object. The default value for this docker image is context, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.authorization.RequestTimeoutSeconds | int | `10` | Maximum time a single outbound request is allowed to run before it is cancelled. Default in .NET is 100. |
| application.appSettings.authorization.baseUrl | string | `""` | The BASE URL to the .Stat Suite's Authorization service |
| application.appSettings.authorization.enabled | bool | `true` | Determines if UserAuthorizationRulesMiddlerwareBuilder is activated for authorization. The default value for this docker image is true, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.authorization.method | string | `"dotstat.webapi"` | authorization uses .Stat Suite's authorization rules. The default value for this docker image is dotstat, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.autoDeleteMappingSets | bool | `true` | Specifies if NSI WS should also delete related mapping sets upon deletion of a dataflow. The default value for this docker image is true, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.categorisation.createStubCategory | string | `"false"` | There is a feature to create a stub Category for any missing categories when it imports a SDMX v2.1 Categorisation or SDMX v2.0 Dataflow/Metadataflow with CategoryReference. By default this feature is working and to disable it the value categorisation. createStubCategory must be set to false or the setting file must be removed. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.clientRateLimitPolicies.clientRules | list | `[]` |  |
| application.appSettings.clientRateLimiting.clientIdHeader | string | `"X-ClientId"` |  |
| application.appSettings.clientRateLimiting.enableEndpointRateLimiting | bool | `false` |  |
| application.appSettings.clientRateLimiting.enabled | bool | `false` |  |
| application.appSettings.clientRateLimiting.generalRules[0].endpoint | string | `"*"` |  |
| application.appSettings.clientRateLimiting.generalRules[0].limit | int | `10` |  |
| application.appSettings.clientRateLimiting.generalRules[0].period | string | `"1m"` |  |
| application.appSettings.clientRateLimiting.httpStatusCode | int | `429` |  |
| application.appSettings.clientRateLimiting.stackBlockedRequests | bool | `false` |  |
| application.appSettings.confidentialityStatusValues | object | `{"enabled":"true","values":"N,C,E"}` | It is possible the deal with SDMX-confidential or SDMX-embargoed data when the feature is enabled. The values property defines which attributes are handled by the service. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.datasetAction | string | `"Information"` |  |
| application.appSettings.datastructure.allowSdmx21CrossSectional | string | `"true"` | Controls the behavior of the Web Service conserning Cross Sectional SDMX v2.0 support in SDMX v2.1 Structure and data formats. By default it is allowed. To disable it the datastructure. allowSdmx21CrossSectional must be set to false or the setting file must be removed. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.defaultCultureInfo | string | `"en"` | Sets the default culture of the service using a two-letter culture code. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.enableReleaseManagement | bool | `false` | Controls if access to PIT (point-in-time) release data allowed on this NSI WS instance (please note that corresponding user authorization rule(s) must be created also). https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.enableResponseCompression | string | `"true"` | Specifies whether the response compression middleware of ASP.NET Core should be used to compress server responses. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.errorHandling | object | `{"sdmxrestv1":{"noResultsUse404":"true","semanticErrorUse403":"true"}}` | Starting from SDMX RI v10, by default the SDMX REST v1 API follows the SDMX REST v2 API status codes. Specifically, the following status codes for SDMX REST v1 deviate from the standard:  | Error          | SDMX REST v1 standard | SDMX REST v1 (NSIWS) | SDMX REST v2 (standard & NSIWS) | |----------------|-----------------------|----------------------|---------------------------------| | No results     | 404                   | 204                  | 204                             | | Semantic error | 403                   | 422                  | 422                             |  https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.excludeNonCodedDimensionsDuringConstraintCalculation | bool | `false` | Exclude non-coded dimension from dynamic availability constraints generation (/rest/availableconstraint/*) https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.googleLogging.enabled | bool | `false` |  |
| application.appSettings.googleLogging.logId | string | `"YOUR_LOG_ID"` |  |
| application.appSettings.googleLogging.logLevel | string | `"Debug"` |  |
| application.appSettings.googleLogging.projectId | string | `"YOUR_GOOGLE_PROJECT_ID"` |  |
| application.appSettings.httpHeaders | object | `{"varyHeader":{"varyBy":["Accept","Accept-Language","Accept-Encoding","Accept-Charset"]}}` | By default the entries under httpHeaders.varyHeader.varyBy in config/httpHeaders.json will be used in the response in a Vary header if they are present in the request. If the Vary header is already present, any additional values that are not already present in the Vary header will be appended. To disable this functionality simply remove or change the extension of the json file. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CACHING.md |
| application.appSettings.mappingStore.Id.Default | string | `"design"` | The unique identifier of the data space of the NSI WS instance (also used at authorization rules), e.g. "design". https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.mappingStore.Id.FromQueryParameter | string | `"Never"` | A parameter controlling whether store id (i.e. data space id) could be provided in GET Query parameter. The default value for this docker image is Never, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.maxNumberObservationsToSortForPaginatedRequests | int | `0` | It is possible to set the max number observations to sort for paginated requests. In case the user's filter exceeds the maximum number of observations to be sorted for range requests (paginated), only the first page can be returned without any ordering. 0 = unlimited https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.maxRequestBodySize | int | `52428800` | Maximum request body size https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.requestLimit.considerActualContentConstraintsInLimit | bool | `true` | Should actual content constraints be considered when estimating the number of observations |
| application.appSettings.requestLimit.requestLimit | int | `0` | To enable request limits, set the following value a value larger than 0 |
| application.appSettings.responseCache.availableconstraint.enabled | bool | `false` |  |
| application.appSettings.responseCache.availableconstraint.location | string | `"any"` |  |
| application.appSettings.responseCache.availableconstraint.maxAge | int | `3600` |  |
| application.appSettings.responseCache.availableconstraint.varyByHeader | string | `"Accept, Accept-Language, Accept-Encoding, Accept-Charset"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[0] | string | `"flowRef"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[1] | string | `"key"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[2] | string | `"providerRef"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[3] | string | `"mode"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[4] | string | `"references"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[5] | string | `"startPeriod"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[6] | string | `"endPeriod"` |  |
| application.appSettings.responseCache.availableconstraint.varyByQueryKeys[7] | string | `"updatedAfter"` |  |
| application.appSettings.responseCache.data.enabled | bool | `false` |  |
| application.appSettings.responseCache.data.location | string | `"any"` |  |
| application.appSettings.responseCache.data.maxAge | int | `3600` |  |
| application.appSettings.responseCache.data.varyByHeader | string | `"X-Range, Accept, Accept-Language, Accept-Encoding, Accept-Charset"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[0] | string | `"detail"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[10] | string | `"endPeriod"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[1] | string | `"c"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[2] | string | `"updatedAfter"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[3] | string | `"firstNObservations"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[4] | string | `"lastNObservations"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[5] | string | `"dimensionAtObservation"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[6] | string | `"attributes"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[7] | string | `"measures"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[8] | string | `"includeHistory"` |  |
| application.appSettings.responseCache.data.varyByQueryKeys[9] | string | `"startPeriod"` |  |
| application.appSettings.responseCache.maximumBodySize | int | `64000000` |  |
| application.appSettings.responseCache.sizeLimit | int | `512000000` |  |
| application.appSettings.responseCache.structures.enabled | bool | `false` |  |
| application.appSettings.responseCache.structures.location | string | `"any"` |  |
| application.appSettings.responseCache.structures.maxAge | int | `3600` |  |
| application.appSettings.responseCache.structures.varyByHeader | string | `"Accept, Accept-Language, Accept-Encoding, Accept-Charset"` |  |
| application.appSettings.responseCache.structures.varyByQueryKeys[0] | string | `"references"` |  |
| application.appSettings.responseCache.structures.varyByQueryKeys[1] | string | `"detail"` |  |
| application.appSettings.responseCache.useCaseSensitivePaths | bool | `false` |  |
| application.appSettings.structureUsage.structureType | string | `"dataflow"` | When requesting data for SDMX v2.1 there is a configurabile option to use either the datastructure or the dataflow in the header of the response. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.appSettings.useCultureSpecificColumnAndDecimalSeparators | string | `"true"` | Allows configuring specific characters as SDMX-CSV column & decimal separators per locale defined by the Accept-Language header of the request. The default value for this docker image is true. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.appSettings.useHierarchicalCodelists | string | `"true"` | Specifies if NSI WS should output Hierarchical Codelists (HCL) parents in JSON message, based on annotation (HIER_CONTEXT). See more here and example DSD here. The default value for this docker image is true, which normally should not be changed. https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/README.md |
| application.authenticationMiddleware.enabled | bool | `false` |  |
| application.constantHeaders | list | `[{"name":"test","type":"String","value":"true"},{"name":"senderid","type":"String","value":"SOME_NSI"}]` | The configuration element is used to define various values of a default header that the application will use in case no other header is defined in the mapping assistant. The settings names correspond to the Header element as defined by SDMX standard. Only senderid and test are mandatory. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.corsMiddleware.enabled | bool | `false` | Enable CORS See https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CORSConfiguration.md |
| application.corsMiddleware.rules[0].allowCredentials | bool | `true` | Controls whether to expose the response to frontend JavaScript code when credentials are used. |
| application.corsMiddleware.rules[0].allowedHeaders | list | `["Range","Origin","Authorization","X-Level","X-Range"]` | The list of request HTTP headers |
| application.corsMiddleware.rules[0].allowedMethods | string | `"*"` | The list of allowed HTTP methods |
| application.corsMiddleware.rules[0].domain | string | `"*"` | This matches the host or domain where the Javascript is hosted |
| application.corsMiddleware.rules[0].exposedHeaders | list | `["Location","Content-Range"]` | The server whitelist header that browsers are allowed to access |
| application.enableSubmitStructure | bool | `true` | Enable submit structure functionality. https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.enforceEmbargoTimeType | bool | `true` |  |
| application.ignoreProductionFlagForData | bool | `true` | ?? |
| application.ignoreProductionFlagForStructure | bool | `true` | ?? |
| application.insertNewStructItems | bool | `true` | Options for the Mapping Store: InsertNewItems: value to determine if the application should insert new item scheme values EnforceEmbargoTimeType: indicates whether the EMBARGO_TIME attribute needs to be validated RetrieveAnnotationsInBatchFetch: indicates whether anntotations are fetched in batches. Defaults to false where annotations are fetched per artefact https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md |
| application.maxReceivedMessageSize | int | `10485760` | Size of message that can be received |
| application.middelwareOrder | list | `["CorsMiddlewareBuilder","OpenIdMiddlewareBuilder","LoggingOptionsBuilder","UserAuthorizationRulesMiddlerwareBuilder","PolicyModuleMiddlewareBuilder"]` | A list that determines the order for the middleware implementations |
| application.openIdMiddelware.allowAnonymous | bool | `false` | Is anonymous access allowed (request without JWT token) |
| application.openIdMiddelware.audience | string | `"clientId"` | Expected `aud` claim during token validation, if not set equals to `clientId` |
| application.openIdMiddelware.authority | string | `""` | Authority url of token issuer |
| application.openIdMiddelware.authorizationUrl | string | `""` | Authorization url (used in swagger UI interface) |
| application.openIdMiddelware.claimsMapping | object | `{"email":"email","groups":"groups"}` | Key/value mapping of a key used in the C# code to JWT token claim. |
| application.openIdMiddelware.clientId | string | `""` | Client/application Id |
| application.openIdMiddelware.enabled | bool | `false` | Is openid authentication enabled |
| application.openIdMiddelware.requireHttps | bool | `false` | Is HTTPS connection to OpenId authority server required |
| application.openIdMiddelware.scopes | list | `["openid","profile","email"]` | Requested openId scopes (used as parameters for authorization url) |
| application.openIdMiddelware.showPii | bool | `false` | If set to TRUE outputs addition debug information in case of invalid token |
| application.openIdMiddelware.tokenUrl | string | `""` | Token url (used in swagger UI interface), optional, if not defined will be constructed based on authorizationUrl |
| application.openIdMiddelware.validateIssuer | bool | `false` | Is iss (issuer) claim in JTW token should match configured authority |
| application.policyMiddleware.enabled | bool | `false` |  |
| application.readOnlyData | bool | `false` | Use the reader user to connect to the data database, if false uses the writer user |
| application.readOnlyStructure | bool | `false` | Use the reader user to connect to the structures database, if false uses the writer user |
| application.retrieveAnnotationsInBatchFetch | bool | `false` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| commandOverride | list | `[]` | Override the default start command of the container |
| databases.data.additionalParams | list | `[]` | Additional parameters for all connection strings |
| databases.data.dbName | string | `""` | Database name |
| databases.data.probe.enabled | bool | `false` |  |
| databases.data.probe.extraLabels | object | `{}` |  |
| databases.data.probe.interval | string | `"30s"` |  |
| databases.data.probe.module | string | `"tcp_connect"` |  |
| databases.data.probe.probeLabel | string | `""` |  |
| databases.data.probe.proberPath | string | `"/probe"` |  |
| databases.data.probe.proberUrl | string | `""` |  |
| databases.data.probe.relabelings | list | `[]` |  |
| databases.data.probe.selectorLabel | string | `""` |  |
| databases.data.serverHostname | string | `""` | Server URL |
| databases.data.serverPort | int | `1433` |  |
| databases.data.type | string | `"SqlServer"` | Database type |
| databases.data.userSecrets.admin.additionalParams | list | `[]` | Additional parameters for admin connection string |
| databases.data.userSecrets.admin.annotations | object | `{}` |  |
| databases.data.userSecrets.admin.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| databases.data.userSecrets.admin.name | string | `""` | Secret name for username and password |
| databases.data.userSecrets.admin.password.key | string | `""` | The password secret key |
| databases.data.userSecrets.admin.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| databases.data.userSecrets.admin.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| databases.data.userSecrets.admin.username.key | string | `""` | The username secret key |
| databases.data.userSecrets.admin.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| databases.data.userSecrets.reader | object | `{}` |  |
| databases.data.userSecrets.writer.additionalParams | list | `[]` | Additional parameters for writer connection string |
| databases.data.userSecrets.writer.annotations | object | `{}` |  |
| databases.data.userSecrets.writer.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| databases.data.userSecrets.writer.name | string | `""` | Secret name for username and password |
| databases.data.userSecrets.writer.password.key | string | `""` | The password secret key |
| databases.data.userSecrets.writer.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| databases.data.userSecrets.writer.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| databases.data.userSecrets.writer.username.key | string | `""` | The username secret key |
| databases.data.userSecrets.writer.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| databases.structure.additionalParams | list | `[]` | Additional parameters for all connection strings |
| databases.structure.dbName | string | `""` | Database name |
| databases.structure.probe.enabled | bool | `false` |  |
| databases.structure.probe.extraLabels | object | `{}` |  |
| databases.structure.probe.interval | string | `"30s"` |  |
| databases.structure.probe.module | string | `"tcp_connect"` |  |
| databases.structure.probe.probeLabel | string | `""` |  |
| databases.structure.probe.proberPath | string | `"/probe"` |  |
| databases.structure.probe.proberUrl | string | `""` |  |
| databases.structure.probe.relabelings | list | `[]` |  |
| databases.structure.probe.selectorLabel | string | `""` |  |
| databases.structure.serverHostname | string | `""` | Server URL |
| databases.structure.serverPort | int | `1433` |  |
| databases.structure.userSecrets.admin.additionalParams | list | `[]` | Additional parameters for admin connection string |
| databases.structure.userSecrets.admin.annotations | object | `{}` |  |
| databases.structure.userSecrets.admin.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| databases.structure.userSecrets.admin.name | string | `""` | Secret name for username and password |
| databases.structure.userSecrets.admin.password.key | string | `""` | The password secret key |
| databases.structure.userSecrets.admin.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| databases.structure.userSecrets.admin.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| databases.structure.userSecrets.admin.username.key | string | `""` | The username secret key |
| databases.structure.userSecrets.admin.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| databases.structure.userSecrets.reader | object | `{}` |  |
| databases.structure.userSecrets.writer.additionalParams | list | `[]` | Additional parameters for writer connection string |
| databases.structure.userSecrets.writer.annotations | object | `{}` |  |
| databases.structure.userSecrets.writer.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| databases.structure.userSecrets.writer.name | string | `""` | Secret name for username and password |
| databases.structure.userSecrets.writer.password.key | string | `""` | The password secret key |
| databases.structure.userSecrets.writer.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| databases.structure.userSecrets.writer.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| databases.structure.userSecrets.writer.username.key | string | `""` | The username secret key |
| databases.structure.userSecrets.writer.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| dbInit.data.alterPasswords | bool | `false` | Changes the passwords of existing loginName and ROloginName logins in database |
| dbInit.data.annotations | object | `{}` |  |
| dbInit.data.dropDb | bool | `false` | Drops the database before creating it |
| dbInit.data.enabled | bool | `false` | Enable structure database init job |
| dbInit.data.executeDbaScripts | bool | `true` | The DBA scripts are not executed: it will not create logins / users, won't put the DB in restricted mode while running |
| dbInit.data.executionTimeout | int | `30` | The execution timeout in minutes |
| dbInit.data.googleLogging | object | `{}` |  |
| dbInit.data.image.pullPolicy | string | `"IfNotPresent"` |  |
| dbInit.data.image.repository | string | `"siscc/dotstatsuite-dbup"` |  |
| dbInit.data.image.tag | string | `"v31.0.0"` | Overrides the image tag whose default is the chart appVersion. |
| dbInit.data.podSecurityContext | object | `{}` |  |
| dbInit.data.resources | object | `{}` |  |
| dbInit.data.rollDeployment | bool | `false` | Roll deployment on job change |
| dbInit.data.securityContext | object | `{}` |  |
| dbInit.data.timezone | string | `""` | Optional. When provided, uses the given value (name of the time zone) instead of trying to determine it in the related sql script(s). Should be used in cases when the stored procedure [MASTER].[dbo.xp_regread] cannot be executed. |
| dbInit.data.volumeMounts | list | `[]` |  |
| dbInit.structure.alterPasswords | bool | `false` | Changes the passwords of existing loginName and ROloginName logins in database |
| dbInit.structure.annotations | object | `{}` |  |
| dbInit.structure.dropDb | bool | `false` | Drops the database before creating it |
| dbInit.structure.enabled | bool | `false` | Enable structure database init job |
| dbInit.structure.executeDbaScripts | bool | `true` | The DBA scripts are not executed: it will not create logins / users, won't put the DB in restricted mode while running |
| dbInit.structure.executionTimeout | int | `30` | The execution timeout in minutes |
| dbInit.structure.googleLogging | object | `{}` |  |
| dbInit.structure.image.pullPolicy | string | `"IfNotPresent"` |  |
| dbInit.structure.image.repository | string | `"siscc/dotstatsuite-dbup"` |  |
| dbInit.structure.image.tag | string | `"v31.0.0"` | Overrides the image tag whose default is the chart appVersion. |
| dbInit.structure.maapiContainer.command.commandOverride | list | `[]` | Override the default start comman of the maapi initContainer |
| dbInit.structure.maapiContainer.command.dbAlias | string | `"nsiws-struct-db"` | Specifies de DB connection alias to be use bij the maapi tool. Usually should not be changed |
| dbInit.structure.maapiContainer.command.dbVersion | string | `"7.10"` | Specifies the mapping store database version to be used, if not the latest is required. Use this parameter only when you know what you are doing. |
| dbInit.structure.maapiContainer.command.resetStructureDb | bool | `false` | Specifies if the mapping store database should reset (true) or persist (false) all the changes done to the artifacts, when the container is restarted. |
| dbInit.structure.maapiContainer.env | list | `[]` | Additional environment variables |
| dbInit.structure.maapiContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| dbInit.structure.maapiContainer.image.repository | string | `"siscc/sdmxri-nsi-maapi"` |  |
| dbInit.structure.maapiContainer.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| dbInit.structure.maapiContainer.resources | object | `{}` |  |
| dbInit.structure.maapiContainer.securityContext | object | `{}` |  |
| dbInit.structure.maapiContainer.volumeMounts | list | `[]` |  |
| dbInit.structure.podSecurityContext | object | `{}` |  |
| dbInit.structure.resources | object | `{}` |  |
| dbInit.structure.rollDeployment | bool | `false` | Roll deployment on job change |
| dbInit.structure.securityContext | object | `{}` |  |
| dbInit.structure.timezone | string | `""` | Optional. When provided, uses the given value (name of the time zone) instead of trying to determine it in the related sql script(s). Should be used in cases when the stored procedure [MASTER].[dbo.xp_regread] cannot be executed. |
| dbInit.structure.volumeMounts | list | `[]` |  |
| env | list | `[]` | Additional environment variables |
| fullnameOverride | string | `""` |  |
| hostAliases | list | `[]` |  |
| httpRoute.additionalRules | list | `[]` | Defines addional rules |
| httpRoute.annotations | object | `{}` | Add annotations to the route |
| httpRoute.enabled | bool | `false` | enables the creation of an HTTPRoute |
| httpRoute.hostnames | list | `[]` | Hostnames to match the route |
| httpRoute.parentRefs | list | `[]` | A least one parentRef is required |
| httpRoute.serviceBackendFilters | list | `[]` | Defines filters for the default backend |
| httpRoute.serviceBackendMatches | list | `[{"path":{"type":"PathPrefix","value":"/"}}]` | Defines what the default service backend matches |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"siscc/sdmxri-nsi-maapi"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initResources | object | `{}` | Resource requests and limits for the main deployment init container |
| monitoring.collectionCount | int | `3` | The collectionCount is the amount of collections exposed at the metrics endpoint |
| monitoring.collectionInterval | int | `5` | The collectionInterval is the amount of seconds between 2 collection events |
| monitoring.enabled | bool | `false` | Enable monitoring by adding a dotnet monitoring side-car |
| monitoring.env | list | `[]` | Additional environment variables |
| monitoring.grafanaDashboard.enabled | bool | `false` |  |
| monitoring.image | object | `{"pullPolicy":"IfNotPresent","repository":"mcr.microsoft.com/dotnet/monitor","tag":"8"}` | Monitoring is build for the dotnet-monitor container from Microsoft |
| monitoring.image.tag | string | `"8"` | Overrides the image tag whose default is the chart appVersion. |
| monitoring.port | int | `52325` | Port number to listen to for metrics requests |
| monitoring.providers | list | `[{"ProviderName":"System.Runtime"},{"ProviderName":"Microsoft.AspNetCore.Hosting"},{"ProviderName":"Microsoft.AspNetCore.Http.Connections"},{"ProviderName":"Microsoft-AspNetCore-Server-Kestrel"},{"ProviderName":"System.Net.Http"}]` | Additional metrics providers and counter names https://github.com/dotnet/dotnet-monitor/blob/main/documentation/configuration/metrics-configuration.md#custom-metrics |
| monitoring.resources | object | `{}` |  |
| monitoring.securityContext | object | `{}` | Make sure the user for the main container and the monitoring side car are the same! |
| monitoring.serviceMonitor.enabled | bool | `false` | Enables the deployment of a serviceMonitor resource |
| monitoring.volumeMounts | list | `[]` |  |
| nameOverride | string | `""` |  |
| networkPolicies.additionalIngressRules | list | `[]` |  |
| networkPolicies.egressRules | list | `[]` |  |
| networkPolicies.enableEgress | bool | `false` | Enable egress policies |
| networkPolicies.enableIngress | bool | `true` | Enable ingress network policies |
| networkPolicies.enabled | bool | `false` | Enables the deployment of network policies You can use YAML anchors to refer to other parts of the values file, like the service port for example https://helm.sh/docs/chart_template_guide/yaml_techniques/#yaml-anchors |
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
| resources | object | `{}` | Resource requests and limits |
| revisionHistoryLimit | int | `10` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
