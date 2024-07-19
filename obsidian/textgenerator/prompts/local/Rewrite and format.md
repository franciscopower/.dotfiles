---
promptId: Rewrite and format
name: 🗞️Rewrite and format
description: Rewrite and format as a markdown note
author: Francisco Power
tags:
  - "#prompt-template"
version: 0.0.1
disableProvider: false
---
content:
{{tg_selection}}
prompt:
This is a very messy note I took. Rewrite it so that it is clear and concise, using markdown to format the note. At the bottom of the note, write 3 possible follow-up questions to research deeper on the topics of the note, and place them in a block as such:
>[!question]- Dig deeper
>- Generated content here

***
{{output}}


