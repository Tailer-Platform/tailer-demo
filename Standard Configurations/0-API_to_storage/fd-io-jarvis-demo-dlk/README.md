## Send message

### Product

```json
{
    "product_id": "123456789",
    "label": "Some label ABC",
    "description": "A specific description for product 123456789"
}

{
    "product_id": "987654321",
    "label": "Some label YUI",
    "description": "A specific description for product 987654321"
}

{
    "product_id": "66668888",
    "label": "Some label XYZ",
    "description": "A specific description for product 66668888"
}
```

ewogICAgInByb2R1Y3RfaWQiOiAiMTIzNDU2Nzg5IiwKICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIEFCQyIsCiAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCn0=
ewogICAgInByb2R1Y3RfaWQiOiAiOTg3NjU0MzIxIiwKICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA5ODc2NTQzMjEiCn0=
ewogICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWFlaIiwKICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDY2NjY4ODg4Igp9

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgInByb2R1Y3RfaWQiOiAiMTIzNDU2Nzg5IiwKICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIEFCQyIsCiAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/tailer-ats-demo-products:publish"


#### Product v2

```json
{
    "input-data": [
        {
            "product_id": "123456789",
            "label": "Some label ABC",
            "description": "A specific description for product 123456789",
            "new_attribute": "test"
        },
        {
            "product_id": "987654321",
            "label": "Some label YUI",
            "description": "A specific description for product 987654321"
        },
        {
            "product_id": "66668888",
            "label": "Some label XYZ",
            "description": "A specific description for product 66668888"
        }
    ]
}

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiLAogICAgICAgICAgICAibmV3X2F0dHJpYnV0ZSI6ICJ0ZXN0IgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICI5ODc2NTQzMjEiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBZVUkiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA5ODc2NTQzMjEiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjY2NjY4ODg4IiwKICAgICAgICAgICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWFlaIiwKICAgICAgICAgICAgImRlc2NyaXB0aW9uIjogIkEgc3BlY2lmaWMgZGVzY3JpcHRpb24gZm9yIHByb2R1Y3QgNjY2Njg4ODgiCiAgICAgICAgfQogICAgXQp9
```

alternate topic :  ats-topic-000099-ats-example-products


TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIKICAgICAgICB9CiAgICBdCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/tailer-ats-demo-v2-products:publish"

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIKICAgICAgICB9CiAgICBdCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"



#### Add property

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiLAogICAgICAgICAgICAibmV3X2F0dHJpYnV0ZSI6ICJ0ZXN0IgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICI5ODc2NTQzMjEiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBZVUkiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA5ODc2NTQzMjEiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjY2NjY4ODg4IiwKICAgICAgICAgICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWFlaIiwKICAgICAgICAgICAgImRlc2NyaXB0aW9uIjogIkEgc3BlY2lmaWMgZGVzY3JpcHRpb24gZm9yIHByb2R1Y3QgNjY2Njg4ODgiCiAgICAgICAgfQogICAgXQp9"}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"



#### Product v2 ERROR

```json
{
    "input-dataaaaaa": [
        {
            "product_id": "123456789",
            "label": "Some label ABC",
            "description": "A specific description for product 123456789"
        },
        {
            "product_id": "987654321",
            "label": "Some label YUI",
            "description": "A specific description for product 987654321"
        },
        {
            "product_id": "66668888",
            "label": "Some label XYZ",
            "description": "A specific description for product 66668888"
        }
    ]
}
```

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGFhYWFhYSI6IFsKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjEyMzQ1Njc4OSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIEFCQyIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDEyMzQ1Njc4OSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiOTg3NjU0MzIxIiwKICAgICAgICAgICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWVVJIiwKICAgICAgICAgICAgImRlc2NyaXB0aW9uIjogIkEgc3BlY2lmaWMgZGVzY3JpcHRpb24gZm9yIHByb2R1Y3QgOTg3NjU0MzIxIgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICI2NjY2ODg4OCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFhZWiIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDY2NjY4ODg4IgogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"



### Sale

```json
{
    "sale_id": "123456789",
    "date": "2021-05-12T13:31:29.477Z ",
    "total_billed": 57.78,
    "items": [
        {
            "item_id": "123456789",
            "item_type": "product",
            "label": "some label for the item",
            "price": 12.56,
            "currency": "EUR"
        },
        {
            "item_id": "987654321",
            "item_type": "product",
            "label": "some label for the item",
            "price": 45.22,
            "currency": "EUR"
        }
    ]
}

{
    "sale_id": "478513685",
    "date": "2021-06-10T10:21:13.125Z ",
    "total_billed": 49.21,
    "items": [
        {
            "item_id": "478951258",
            "item_type": "product",
            "label": "some label for the item",
            "price": 39.99,
            "currency": "EUR"
        },
        {
            "item_id": "1452987523",
            "item_type": "product",
            "label": "some label for the item",
            "price": 9.22,
            "currency": "EUR"
        }
    ]
}


```

ewogICAgInNhbGVfaWQiOiAiMTIzNDU2Nzg5IiwKICAgICJkYXRlIjogIjIwMjEtMDUtMTJUMTM6MzE6MjkuNDc3WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDU3Ljc4LAogICAgIml0ZW1zIjogWwogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiMTIzNDU2Nzg5IiwKICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgInByaWNlIjogMTIuNTYsCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJpdGVtX2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICJwcmljZSI6IDQ1LjIyLAogICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIgogICAgICAgIH0KICAgIF0KfQ==

ewogICAgInNhbGVfaWQiOiAiNDc4NTEzNjg1IiwKICAgICJkYXRlIjogIjIwMjEtMDYtMTBUMTA6MjE6MTMuMTI1WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgIml0ZW1zIjogWwogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiNDc4OTUxMjU4IiwKICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgInByaWNlIjogMzkuOTksCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJpdGVtX2lkIjogIjE0NTI5ODc1MjMiLAogICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAicHJpY2UiOiA5LjIyLAogICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIgogICAgICAgIH0KICAgIF0KfQ==

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgInNhbGVfaWQiOiAiMTIzNDU2Nzg5IiwKICAgICJkYXRlIjogIjIwMjEtMDUtMTJUMTM6MzE6MjkuNDc3WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDU3Ljc4LAogICAgIml0ZW1zIjogWwogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiMTIzNDU2Nzg5IiwKICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgInByaWNlIjogMTIuNTYsCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJpdGVtX2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICJwcmljZSI6IDQ1LjIyLAogICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIgogICAgICAgIH0KICAgIF0KfQ=="},
    {"attributes": {}, "data": "ewogICAgInNhbGVfaWQiOiAiNDc4NTEzNjg1IiwKICAgICJkYXRlIjogIjIwMjEtMDYtMTBUMTA6MjE6MTMuMTI1WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgIml0ZW1zIjogWwogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiNDc4OTUxMjU4IiwKICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgInByaWNlIjogMzkuOTksCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJpdGVtX2lkIjogIjE0NTI5ODc1MjMiLAogICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAicHJpY2UiOiA5LjIyLAogICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIgogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/tailer-ats-demo-sales:publish"

### Add property

{
    "sale_id": "478513685",
    "date": "2021-06-10T10:21:13.125Z ",
    "total_billed": 49.21,
    "added_property": "test",
    "items": [
        {
            "item_id": "478951258",
            "item_type": "product",
            "label": "some label for the item",
            "price": 39.99,
            "currency": "EUR",
            "comments": "This is a comment"
        },
        {
            "item_id": "1452987523",
            "item_type": "product",
            "label": "some label for the item",
            "price": 9.22,
            "currency": "EUR"
        }
    ]
}

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgInNhbGVfaWQiOiAiNDc4NTEzNjg1IiwKICAgICJkYXRlIjogIjIwMjEtMDYtMTBUMTA6MjE6MTMuMTI1WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgImFkZGVkX3Byb3BlcnR5IjogInRlc3QiLAogICAgIml0ZW1zIjogWwogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiNDc4OTUxMjU4IiwKICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgInByaWNlIjogMzkuOTksCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiLAogICAgICAgICAgICAiY29tbWVudHMiOiAiVGhpcyBpcyBhIGNvbW1lbnQiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJpdGVtX2lkIjogIjE0NTI5ODc1MjMiLAogICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAicHJpY2UiOiA5LjIyLAogICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIgogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/tailer-ats-demo-sales:publish"


### Rejected scenario

{
    "sale_id": "478513685",
    "date": "2021-06-10T10:21:13.125Z ",
    "total_billed": 49.21,
    "added_property": "test"
    "items": [
        {
            "item_id": "478951258",
            "item_type": "product",
            "label": "some label for the item",
            "price": 39.99,
            "currency": "EUR",
            "comments": "This is a comment"
        },
        {
            "item_id": "1452987523",
            "item_type": "product",
            "label": "some label for the item",
            "price": 9.22,
            "currency": "EUR"
        }
    ]
}

TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgInNhbGVfaWQiOiAiNDc4NTEzNjg1IiwKICAgICJkYXRlIjogIjIwMjEtMDYtMTBUMTA6MjE6MTMuMTI1WiAiLAogICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgImFkZGVkX3Byb3BlcnR5IjogInRlc3QiCiAgICAiaXRlbXMiOiBbCiAgICAgICAgewogICAgICAgICAgICAiaXRlbV9pZCI6ICI0Nzg5NTEyNTgiLAogICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAicHJpY2UiOiAzOS45OSwKICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIsCiAgICAgICAgICAgICJjb21tZW50cyI6ICJUaGlzIGlzIGEgY29tbWVudCIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgIml0ZW1faWQiOiAiMTQ1Mjk4NzUyMyIsCiAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICJwcmljZSI6IDkuMjIsCiAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgfQogICAgXQp9"}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/tailer-ats-demo-sales:publish"




