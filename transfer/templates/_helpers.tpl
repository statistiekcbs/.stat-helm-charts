{{/*
Expand the name of the chart.
*/}}
{{- define "transfer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "transfer.fullname" -}}
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
{{- define "transfer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "transfer.labels" -}}
helm.sh/chart: {{ include "transfer.chart" . }}
{{ include "transfer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "transfer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "transfer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "transfer.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "transfer.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name for the input volume and claim
*/}}
{{- define "transfer.inputVolumeName" -}}
  {{ include "transfer.fullname" . }}-input
{{- end }}

{{/*
Create the name for the archive volume and claim
*/}}
{{- define "transfer.archiveVolumeName" -}}
  {{ include "transfer.fullname" . }}-archive
{{- end }}

{{/*
Create the name of the DB external secret
*/}}
{{- define "transfer.dbGeneratedSecretName" -}}
{{- if .key -}}
  {{- printf "%s-%s-%s" (include "transfer.fullname" .root ) .type .key }}
{{- else -}}
  {{- printf "%s-%s" (include "transfer.fullname" .root ) .type }}
{{- end -}}
{{- end }}

{{/*
Create the name of an external secret
*/}}
{{- define "transfer.generatedSecretName" -}}
{{- printf "%s-%s" (include "transfer.fullname" .root ) ( join "-" .parts ) }}
{{- end }}

{{/*
Returns the secret name of a database credential secret
*/}}
{{- define "transfer.dbSecretName" -}}
{{- if .isExternal -}}
  {{- if and .target .target.name -}}
    {{- .target.name  }}
  {{- end -}}
{{- else -}}
  {{ .name }}
{{- end -}}
{{- end }}