### Demo for TTT

- Launch TTT 000099_tailer_demo_iowa_liquor_prepare_pda
- Get Last Status TTT 000099_tailer_demo_iowa_liquor_prepare_pda




### Launch

TAILER_API_JWT=`tailer auth get-token | sed '7q;d' | sed 's/User token : //g'` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TAILER_API_JWT}" \
--data '{ "action": "launch_job",
          "account": "000099",
          "environment": "DEV",
          "configuration_type": "table-to-table",
          "configuration_id": "000099_tailer_demo_iowa_liquor_prepare_pda"}' \
"https://tailer-api-nqonovswsq-ew.a.run.app/v1/dag/launch"


### Get last status

TAILER_API_JWT=`tailer auth get-token | sed '7q;d' | sed 's/User token : //g'` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TAILER_API_JWT}" \
--data '{"action": "get_last_status",
         "account": "000099",
         "environment": "DEV",
         "configuration_type": "table-to-table",
         "configuration_id": "000099_tailer_demo_iowa_liquor_prepare_pda"}' \
"https://tailer-api-nqonovswsq-ew.a.run.app/v1/dag/status"


