#!/bin/bash

# Variables
table_name="agent-settings-service-${TF_VAR_stage}-agent-states"
output_file="kubernetes-configuration-${TF_VAR_stage}.json"

table_status=$(aws dynamodb describe-table --table-name "$table_name" --query "Table.TableStatus" --region=us-east-1 --output text 2>/dev/null)

if [ "$table_status" != "ACTIVE" ]; then
    echo "Warning: DynamoDB table '$table_name' does not exist or is not active. Status: '$table_status'"
    echo "{}" > "$output_file"
else
    echo "DynamoDB table EXISTS"
    aws dynamodb scan --table-name "$table_name" --region=us-east-1 --output json | \
    jq --arg stage "$TF_VAR_stage" '[.Items[] |
        select(.agentKey.S != $stage) |
        {organizationId: .organizationId.S, agentKey: .agentKey.S} +
        (if (.logs.M.dynamo.M.selfHosted.M.region.S and .logs.M.dynamo.M.selfHosted.M.accountId.S) then
            {logs: { dynamo: { selfHosted: {region: .logs.M.dynamo.M.selfHosted.M.region.S, accountId: .logs.M.dynamo.M.selfHosted.M.accountId.S}}}}
         else
            {}
         end)
    ]' > "$output_file"
fi

cat $output_file
