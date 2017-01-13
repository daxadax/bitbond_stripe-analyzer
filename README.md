#Stripe Analyzer
###Test-task for Bitbond

###Proposed Flow

####User (/connect)

1. Connect to Account (Read-Only)
  * use an ngrok tunnel for the stripe callback
  * pull the 'code' attribute from the response and store as `AUTH_CODE`
  * fetch token and store data from oauth

2. Fetch and store Stripe data for the given user

3. Process/Analyze data by month and by the average per month
  * Number of Charges
  * Total Incoming Amount
  * Total Outgoing Amount
  * Year-over-Year Change / Volitility

####Admin (/admin)

1. Serve analyzed data using Dimple.js

--- 

After four hours of implementation, I completed steps 1 and 2 of the proposed
flow, although step 2 is not well tested.
