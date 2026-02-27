# .Stat helm charts

This is a helm chart repository for installing .Stat Core components.

## Setup

Clone the repository locally (there is no chart repository or registry yet).

Copy the `values.yaml` file from the chart you want to deploy and update the
values as needed (database config, ingress/HTTPRoute, etc.)

Deploy the chart using the helm install command:

```
helm install -f myValues.yaml <release name> <component folder name>
```

## Charts

- [auth](auth/README/md): deploys the .Stat authorization service including the DBup tool for the
  common database
- [nsiws](nsiws/README.md): deploys the .Stat NSI WebService including the DBup tool for the data
  and structure database
- [transfer](transfer/README.md): deploys the .Stat transfer service
- [core](core/README.md): a bundle of the above charts including two NSI webservice deployments,
  one for design and one for dissemination
