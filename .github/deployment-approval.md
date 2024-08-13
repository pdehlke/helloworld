---
title: Deployment Approval Required for release {{ env.TAG }} in {{ env.ENVIRONMENT }}
labels: deployment-requested
---

Deployment Approval requested from {{ payload.sender.login }}.

A member of the approver-team must comment "/approved" to kick off the deployment.


=== DON'T CHANGE BELOW THIS LINE
```json target_payload
{
    "runNumber":  {{ env.RUNNUMBER }},
    "environment": "{{ env.ENVIRONMENT }}",
    "tag": "{{ env.TAG }}",
    "sha": "{{ env.SHA }}"
}
```
