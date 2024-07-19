---
tag: PRM
Relationship: 
VIP: false
Industry:
Location:
Birthday: {{birthdays}}
aliases: ["{{lastfirst}}", "{{firstlast}}", {{emails}}]
---

----

## Contact Info
[Google Contact]({{link}}) 

**Email**: {{emails}} 
**Phone**: {{phones}} 

Organization: {{org.name}}
URL: {{urls}}
Relations: {{relations}}

----

## Assigned Tasks

```dataview
TASK
FROM #todo 
WHERE contains(text, "[[@{{firstname}} {{lastname}}") AND !completed
GROUP BY file.name
```
---

