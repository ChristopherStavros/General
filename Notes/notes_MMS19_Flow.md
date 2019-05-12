# First things

- Microsoft Flow is cloud-based software that allows employees to create and automate workflows and tasks across multiple applications and services without help from developers. Automated workflows are called flows. To create a flow, the user specifies what action should take place when a specific event occurs.
- Flow - part of Office 365
- Power Apps - intended for developers
- Flow - a good place to start
- Flow is completely built off of REST APIs
- FLow free level license - several thousand runs per month
- FLow is a commercial product that leverages you AAD environment - must be licensed separately
- Flow -
  - GAs have access to default site
- Flow - to create an environment you need to be given access through some method

## Power Apps, Logic Apps, and Flow

### Differences?

- PowerApps - suite for developers to tweark apps, good for data manipulation - financial stuff
  - Dynamics365
- Flow - connectors into third party stuff
  - Less controls - must step up and take control of your data
  - Good at taking in and connecting data
- Logic apps - Azure governance - RBAC applies

# Flow administration

## Things to consider

- Tenant restrictions
- Data loss prevention
- Access
- Team flows
- Flow - ENVIRONMENT ADMINs
- Can't turn it off
- Can't restrict access at the APp level
  - Need to restrict access at the Data level!
- User services accounts for your flows
  - Otherwise if you share a Flow it will run under your creds
- Licensing - Flows (runs) per license
- Quotas

# Stuff

- In SharePoint - new PowerApps
- Service now integration
- Anything that has a REST endpoint is doable
  - Need some kind of trigger to kick off the flow
- Approval functionality to FLow is unique in Flow
- Connectors
  - Custom connectors
    - [Example](https://medium.com/capgemini-dynamics-365-team/a-microsoft-flow-custom-connector-step-by-step-from-scratch-microsoft-teams-86c3a35f37dc)
    - Direct SCCM connection possible - Ephgrave
  - Over 200 connectors - must be built by Microsoft
  - There are no 3rd party connectors
  - Set up web URL that triggers a flow
- SCCM custom connector use case?  not sure - Ryan not using yet in prod other that MNSCUG
- Get security poeple involved up front!
- Flow - example
  - Word Press blog changes --> Something happens on Twitter
- Flow like Jenkins?  Connectors, triggers, etc.
- Flow example - click a botton and have the flow email your team your location, some other info?  etc.

- On prem data Gateway??
  - https://docs.microsoft.com/en-us/flow/gateway-reference
  - https://powerbi.microsoft.com/en-us/gateway/

- Connectors - basically connect to a REST API


