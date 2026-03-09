# authz

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v11.0.0](https://img.shields.io/badge/AppVersion-v11.0.0-informational?style=flat-square)

A Helm chart for the .Stat Auth Management Service. See the docs in the source code for more information.

**Homepage:** <https://github.com/statistiekcbs/.stat-helm-charts>

## Source Code

* <https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management>


## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| auth.allowAnonymous | bool | `true` |  |
| auth.audience | string | `"openid"` |  |
| auth.authority | string | `"https://keycloak.user-np01.k8s.cbsp.nl/realms/kerberos"` |  |
| auth.authorizationUrl | string | `"https://keycloak.user-np01.k8s.cbsp.nl/realms/kerberos/protocol/openid-connect/auth"` |  |
| auth.claimsMapping.email | string | `"email"` |  |
| auth.claimsMapping.groups | string | `"groups"` |  |
| auth.clientId | string | `"DotStat-Cbs"` |  |
| auth.enabled | bool | `true` | Is openid authentication enabled |
| auth.requireHttps | bool | `false` |  |
| auth.scopes[0] | string | `"openid"` |  |
| auth.scopes[1] | string | `"profile"` |  |
| auth.scopes[2] | string | `"email"` |  |
| auth.scopes[3] | string | `"groups"` |  |
| auth.showPii | bool | `true` |  |
| auth.validateIssuer | bool | `false` |  |
| dbInit.common.additionalParams | list | `[]` |  |
| dbInit.common.alterPasswords | bool | `false` | Changes the passwords of existing loginName and ROloginName logins in database |
| dbInit.common.annotations | object | `{}` |  |
| dbInit.common.dbName | string | `""` | Database name |
| dbInit.common.dropDb | bool | `false` | Drops the database before creating it |
| dbInit.common.enabled | bool | `false` | Enable structure database init job |
| dbInit.common.executeDbaScripts | bool | `true` | The DBA scripts are not executed: it will not create logins / users, won't put the DB in restricted mode while running |
| dbInit.common.executionTimeout | int | `30` | The execution timeout in minutes |
| dbInit.common.googleLogging | object | `{}` |  |
| dbInit.common.image.pullPolicy | string | `"IfNotPresent"` |  |
| dbInit.common.image.repository | string | `"siscc/dotstatsuite-dbup"` |  |
| dbInit.common.image.tag | string | `"v31.0.0"` | Overrides the image tag whose default is the chart appVersion. |
| dbInit.common.podSecurityContext | object | `{}` |  |
| dbInit.common.resources | object | `{}` |  |
| dbInit.common.rollDeployment | bool | `false` | Roll deployment on job change |
| dbInit.common.securityContext | object | `{}` |  |
| dbInit.common.serverHostname | string | `""` | Server URL |
| dbInit.common.serverPort | int | `1433` |  |
| dbInit.common.timezone | string | `""` | Optional. When provided, uses the given value (name of the time zone) instead of trying to determine it in the related sql script(s). Should be used in cases when the stored procedure [MASTER].[dbo.xp_regread] cannot be executed. |
| dbInit.common.volumeMounts | list | `[]` |  |
| env.autoLogToGoogle | bool | `false` |  |
| fullnameOverride | string | `""` |  |
| httpRoute | object | `{"additionalRules":[],"annotations":{},"enabled":false,"hostnames":[],"parentRefs":[],"serviceBackendFilters":[],"serviceBackendMatches":[{"path":{"type":"PathPrefix","value":"/"}}]}` | Expose the service via gateway-api HTTPRoute Requires Gateway API resources and suitable controller installed within the cluster (see: https://gateway-api.sigs.k8s.io/guides/) |
| httpRoute.additionalRules | list | `[]` | Defines addional rules |
| httpRoute.annotations | object | `{}` | Add annotations to the route |
| httpRoute.enabled | bool | `false` | enables the creation of an HTTPRoute |
| httpRoute.hostnames | list | `[]` | Hostnames to match the route |
| httpRoute.parentRefs | list | `[]` | A least one parentRef is required |
| httpRoute.serviceBackendFilters | list | `[]` | Defines filters for the default backend |
| httpRoute.serviceBackendMatches | list | `[{"path":{"type":"PathPrefix","value":"/"}}]` | Defines what the default service backend matches |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"siscc/dotstatsuite-core-auth-management"` |  |
| image.tag | string | `"v11.0.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/live"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `3` |  |
| nameOverride | string | `""` |  |
| networkPolicies.enableIngress | bool | `true` | Enable ingress network policies |
| networkPolicies.enabled | bool | `false` | Enables the deployment of network policies You can use YAML anchors to refer to other parts of the values file, like the service port for example https://helm.sh/docs/chart_template_guide/yaml_techniques/#yaml-anchors |
| networkPolicies.httpSelectors | list | `[]` | The list selectors allowed to acces the pod on the http port |
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
| probedb.enabled | bool | `false` | Enables an HTTP probe |
| probedb.extraLabels | object | `{}` | Additional labels to add to the probe and prometheus metric |
| probedb.interval | string | `"30s"` | Probe interval |
| probedb.module | string | `"tls_connect"` | Name of the module to use for probing |
| probedb.probeLabel | string | `""` | Value of the "probe" label, defaults to the probe resource name |
| probedb.proberPath | string | `"/probe"` | Path used by the prober |
| probedb.proberUrl | string | `""` | URL of the prober (blackbox exporter) |
| probedb.relabelings | list | `[]` | Metric relabeling |
| probedb.selectorLabel | string | release: rancher-monitoring | Label to get picked up by the monitoring stack |
| probedb.urls | list | `[]` | URLs to probe, usually the HTTPRoute or Ingress hostnames |
| readinessProbe.failureThreshold | int | `2` |  |
| readinessProbe.httpGet.path | string | `"/health"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| startupProbe.failureThreshold | int | `15` |  |
| startupProbe.httpGet.path | string | `"/health"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.initialDelaySeconds | int | `15` |  |
| startupProbe.periodSeconds | int | `5` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.timeoutSeconds | int | `3` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints[0].labelSelector.matchLabels | object | `{}` |  |
| topologySpreadConstraints[0].maxSkew | int | `1` |  |
| topologySpreadConstraints[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| topologySpreadConstraints[0].whenUnsatisfiable | string | `"DoNotSchedule"` |  |
| userSecrets.admin.additionalParams | list | `[]` | Additional parameters for admin connection string |
| userSecrets.admin.annotations | object | `{}` |  |
| userSecrets.admin.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| userSecrets.admin.name | string | `""` | Secret name for username and password |
| userSecrets.admin.password.key | string | `""` | The password secret key |
| userSecrets.admin.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| userSecrets.admin.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| userSecrets.admin.username.key | string | `""` | The username secret key |
| userSecrets.admin.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| userSecrets.reader.additionalParams | list | `[]` | Additional parameters for writer connection string |
| userSecrets.reader.annotations | object | `{}` |  |
| userSecrets.reader.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| userSecrets.reader.name | string | `""` | Secret name for username and password |
| userSecrets.reader.password.key | string | `""` | The password secret key |
| userSecrets.reader.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| userSecrets.reader.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| userSecrets.reader.username.key | string | `""` | The username secret key |
| userSecrets.reader.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| userSecrets.writer.additionalParams | list | `[]` | Additional parameters for writer connection string |
| userSecrets.writer.annotations | object | `{}` |  |
| userSecrets.writer.isExternal | bool | `false` | Set to true to use an external When using an external secret , the secret name is generated |
| userSecrets.writer.name | string | `""` | Secret name for username and password |
| userSecrets.writer.password.key | string | `""` | The password secret key |
| userSecrets.writer.password.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, password.key is used |
| userSecrets.writer.secretStoreRef | object | `{"name":""}` | When using an external secret, secretStoreRef.name is required |
| userSecrets.writer.username.key | string | `""` | The username secret key |
| userSecrets.writer.username.remoteRef | object | `{"key":""}` | When using an external secret, remoteRef.key is required If remoteRef.property is not set, username.key is used |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
