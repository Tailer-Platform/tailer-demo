# API To Storage demo

#### Product

```json
{
    "input-data": [
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

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIKICAgICAgICB9CiAgICBdCn0=


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIKICAgICAgICB9CiAgICBdCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"
```
#### Add property

```json
{
    "input-data": [
        {
            "product_id": "123456789",
            "label": "Some label ABC",
            "description": "A specific description for product 123456789",
            "release_date": "2020-07-22"
        },
        {
            "product_id": "987654321",
            "label": "Some label YUI",
            "description": "A specific description for product 987654321",
            "release_date": "2021-02-05"
        },
        {
            "product_id": "66668888",
            "label": "Some label XYZ",
            "description": "A specific description for product 66668888",
            "release_date": "2020-03-15"
        }
    ]
}
```

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiLAogICAgICAgICAgICAicmVsZWFzZV9kYXRlIjogIjIwMjAtMDctMjIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIsCiAgICAgICAgICAgICJyZWxlYXNlX2RhdGUiOiAiMjAyMS0wMi0wNSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIsCiAgICAgICAgICAgICJyZWxlYXNlX2RhdGUiOiAiMjAyMC0wMy0xNSIKICAgICAgICB9CiAgICBdCn0=


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCAxMjM0NTY3ODkiLAogICAgICAgICAgICAicmVsZWFzZV9kYXRlIjogIjIwMjAtMDctMjIiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAgICJwcm9kdWN0X2lkIjogIjk4NzY1NDMyMSIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFlVSSIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDk4NzY1NDMyMSIsCiAgICAgICAgICAgICJyZWxlYXNlX2RhdGUiOiAiMjAyMS0wMi0wNSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiNjY2Njg4ODgiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBYWVoiLAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiQSBzcGVjaWZpYyBkZXNjcmlwdGlvbiBmb3IgcHJvZHVjdCA2NjY2ODg4OCIsCiAgICAgICAgICAgICJyZWxlYXNlX2RhdGUiOiAiMjAyMC0wMy0xNSIKICAgICAgICB9CiAgICBdCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"
```

#### Product ERROR

```json
{
    "input-data": [
        {
            "product_id": "123456789",
            "label": "Some label ABC"
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

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDEyMzQ1Njc4OSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiOTg3NjU0MzIxIiwKICAgICAgICAgICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWVVJIiwKICAgICAgICAgICAgImRlc2NyaXB0aW9uIjogIkEgc3BlY2lmaWMgZGVzY3JpcHRpb24gZm9yIHByb2R1Y3QgOTg3NjU0MzIxIgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICI2NjY2ODg4OCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFhZWiIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDY2NjY4ODg4IgogICAgICAgIH0KICAgIF0KfQ==


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAibGFiZWwiOiAiU29tZSBsYWJlbCBBQkMiCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDEyMzQ1Njc4OSIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgInByb2R1Y3RfaWQiOiAiOTg3NjU0MzIxIiwKICAgICAgICAgICAgImxhYmVsIjogIlNvbWUgbGFiZWwgWVVJIiwKICAgICAgICAgICAgImRlc2NyaXB0aW9uIjogIkEgc3BlY2lmaWMgZGVzY3JpcHRpb24gZm9yIHByb2R1Y3QgOTg3NjU0MzIxIgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAicHJvZHVjdF9pZCI6ICI2NjY2ODg4OCIsCiAgICAgICAgICAgICJsYWJlbCI6ICJTb21lIGxhYmVsIFhZWiIsCiAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJBIHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciBwcm9kdWN0IDY2NjY4ODg4IgogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-products:publish"
```
### Sale

```json
{
    "input-data": [
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
        },
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
    ]
}
```

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA1LTEyVDEzOjMxOjI5LjQ3N1ogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDU3Ljc4LAogICAgICAgICAgICAiaXRlbXMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTIzNDU2Nzg5IiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogMTIuNTYsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiOTg3NjU0MzIxIiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogNDUuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgICAgICAgICAiaXRlbXMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiNDc4OTUxMjU4IiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogMzkuOTksCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTQ1Mjk4NzUyMyIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDkuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0KICAgIF0KfQ==


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICIxMjM0NTY3ODkiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA1LTEyVDEzOjMxOjI5LjQ3N1ogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDU3Ljc4LAogICAgICAgICAgICAiaXRlbXMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTIzNDU2Nzg5IiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogMTIuNTYsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiOTg3NjU0MzIxIiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogNDUuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgICAgICAgICAiaXRlbXMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiNDc4OTUxMjU4IiwKICAgICAgICAgICAgICAgICAgICAiaXRlbV90eXBlIjogInByb2R1Y3QiLAogICAgICAgICAgICAgICAgICAgICJsYWJlbCI6ICJzb21lIGxhYmVsIGZvciB0aGUgaXRlbSIsCiAgICAgICAgICAgICAgICAgICAgInByaWNlIjogMzkuOTksCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTQ1Mjk4NzUyMyIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDkuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-sales:publish"
```
### Add property

```json
{
    "input-data": [
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
    ]
}
```

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgICAgICAgICAiYWRkZWRfcHJvcGVydHkiOiAidGVzdCIsCiAgICAgICAgICAgICJpdGVtcyI6IFsKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAiaXRlbV9pZCI6ICI0Nzg5NTEyNTgiLAogICAgICAgICAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgICAgICAgICAicHJpY2UiOiAzOS45OSwKICAgICAgICAgICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIiwKICAgICAgICAgICAgICAgICAgICAiY29tbWVudHMiOiAiVGhpcyBpcyBhIGNvbW1lbnQiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJpdGVtX2lkIjogIjE0NTI5ODc1MjMiLAogICAgICAgICAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgICAgICAgICAicHJpY2UiOiA5LjIyLAogICAgICAgICAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIF0KICAgICAgICB9CiAgICBdCn0=


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIiwKICAgICAgICAgICAgInRvdGFsX2JpbGxlZCI6IDQ5LjIxLAogICAgICAgICAgICAiYWRkZWRfcHJvcGVydHkiOiAidGVzdCIsCiAgICAgICAgICAgICJpdGVtcyI6IFsKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAiaXRlbV9pZCI6ICI0Nzg5NTEyNTgiLAogICAgICAgICAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgICAgICAgICAicHJpY2UiOiAzOS45OSwKICAgICAgICAgICAgICAgICAgICAiY3VycmVuY3kiOiAiRVVSIiwKICAgICAgICAgICAgICAgICAgICAiY29tbWVudHMiOiAiVGhpcyBpcyBhIGNvbW1lbnQiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJpdGVtX2lkIjogIjE0NTI5ODc1MjMiLAogICAgICAgICAgICAgICAgICAgICJpdGVtX3R5cGUiOiAicHJvZHVjdCIsCiAgICAgICAgICAgICAgICAgICAgImxhYmVsIjogInNvbWUgbGFiZWwgZm9yIHRoZSBpdGVtIiwKICAgICAgICAgICAgICAgICAgICAicHJpY2UiOiA5LjIyLAogICAgICAgICAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIF0KICAgICAgICB9CiAgICBdCn0="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-sales:publish"
```

### Rejected scenario

```json
{
    "input-data": [
        {
            "sale_id": "478513685",
            "date": "2021-06-10T10:21:13.125Z "
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
    ]
}
```

Base 64  Encoded :

ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIgogICAgICAgICAgICAidG90YWxfYmlsbGVkIjogNDkuMjEsCiAgICAgICAgICAgICJhZGRlZF9wcm9wZXJ0eSI6ICJ0ZXN0IiwKICAgICAgICAgICAgIml0ZW1zIjogWwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJpdGVtX2lkIjogIjQ3ODk1MTI1OCIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDM5Ljk5LAogICAgICAgICAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiLAogICAgICAgICAgICAgICAgICAgICJjb21tZW50cyI6ICJUaGlzIGlzIGEgY29tbWVudCIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTQ1Mjk4NzUyMyIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDkuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0KICAgIF0KfQ==


Send message to Pub/Sub

```bash
TOKEN=`gcloud auth application-default print-access-token` \
&& curl --request POST \
--http2 \
--header "content-type:application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{"messages": [
    {"attributes": {}, "data": "ewogICAgImlucHV0LWRhdGEiOiBbCiAgICAgICAgewogICAgICAgICAgICAic2FsZV9pZCI6ICI0Nzg1MTM2ODUiLAogICAgICAgICAgICAiZGF0ZSI6ICIyMDIxLTA2LTEwVDEwOjIxOjEzLjEyNVogIgogICAgICAgICAgICAidG90YWxfYmlsbGVkIjogNDkuMjEsCiAgICAgICAgICAgICJhZGRlZF9wcm9wZXJ0eSI6ICJ0ZXN0IiwKICAgICAgICAgICAgIml0ZW1zIjogWwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJpdGVtX2lkIjogIjQ3ODk1MTI1OCIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDM5Ljk5LAogICAgICAgICAgICAgICAgICAgICJjdXJyZW5jeSI6ICJFVVIiLAogICAgICAgICAgICAgICAgICAgICJjb21tZW50cyI6ICJUaGlzIGlzIGEgY29tbWVudCIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIml0ZW1faWQiOiAiMTQ1Mjk4NzUyMyIsCiAgICAgICAgICAgICAgICAgICAgIml0ZW1fdHlwZSI6ICJwcm9kdWN0IiwKICAgICAgICAgICAgICAgICAgICAibGFiZWwiOiAic29tZSBsYWJlbCBmb3IgdGhlIGl0ZW0iLAogICAgICAgICAgICAgICAgICAgICJwcmljZSI6IDkuMjIsCiAgICAgICAgICAgICAgICAgICAgImN1cnJlbmN5IjogIkVVUiIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgXQogICAgICAgIH0KICAgIF0KfQ=="}]}' \
"https://pubsub.googleapis.com/v1/projects/fd-io-jarvis-demo-dlk/topics/ats-topic-000099-ats-example-sales:publish"
```



