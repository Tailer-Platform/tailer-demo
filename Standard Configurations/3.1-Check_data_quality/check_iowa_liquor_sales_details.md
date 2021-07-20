## General description

Run a few data quality tests on the sales table after an update:

- PK duplicate: should have none
- sale_dollars max value
- count null store_number
- count null item_number

### Trigger

Triggered on 000099_iowa_liquor_prepare_pda execution.