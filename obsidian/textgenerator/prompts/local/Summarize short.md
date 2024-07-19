---
promptId: Summarize short
name: 🗞️Summarize short
description: Create a short summary and create tags
author: Francisco Power
tags:
  - "#prompt-template"
version: 0.0.1
disableProvider: false
---
content:
{{content}}
prompt:
Do a short summary of this content, no more than 3 sentences, and use markdown formatting. This is for my personal notes, so speak in the first person. After the summary, place at most 3 keywords as #keyword, one line bellow the summary, but all in the same line.

***

>[!summary]
>{{output}}