{{/*
Expand the name of the chart.
*/}}
{{- define "nsiws.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nsiws.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nsiws.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nsiws.labels" -}}
helm.sh/chart: {{ include "nsiws.chart" . }}
{{ include "nsiws.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nsiws.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsiws.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nsiws.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nsiws.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the DB external secret
*/}}
{{- define "nsiws.dbGeneratedSecretName" -}}
{{- printf "%s-%s-%s" (include "nsiws.fullname" .root ) .type .key }}
{{- end }}

{{/*
Returns the secret name of a database credential secret
*/}}
{{- define "nsiws.dbSecretName" -}}
{{- if .isExternal -}}
  {{- if and .target .target.name -}}
    {{- .target.name  }}
  {{- end -}}
{{- else -}}
  {{ .name }}
{{- end -}}
{{- end }}