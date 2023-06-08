{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the app.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "server.name" -}}
{{- $name := default "server" .Values.server.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "meta.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
name: {{ .Release.Name }}
env: {{ .Values.meta.env }}
version: {{ .Values.meta.version }}
maintainer: {{ .Values.meta.maintainer }}
managed-by: {{ .Release.Service }}
helm-chart: {{ include "meta.chart" . }}
{{- end -}}
