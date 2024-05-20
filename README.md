# chatgpt-cli-action

This is a GitHub action based on [https://github.com/marcolardera/chatgpt-cli](chatgpt-cli) that allows
for easy GitHub actions application of ChatGPT to GitHub objects such as issues.

```
docker build -t moxious/chatgpt-cli-action . && docker push moxious/chatgpt-cli-action
```

## Worked Example: Automatically Triage issues with Labels

Note this action will not create labels, it will only comment on the issue,
and apply labels that already exist.  The workflow may fail, if you're asking
the robot to apply a label that does not exist.

```
on:
  issues:
    types:
      - opened

jobs:
  auto_triage_issue:
    uses: moxious/chatgpt-cli-action/.github/workflows/label-issue.yml@main
    with:
      url: ${{ github.event.issue.html_url }}
      possible_labels: |
        type/bug
        type/feature
        type/unknown
        type/other
        type/question
        type/duplicate
        type/invalid
        type/wonfix
        type/helpwanted
        area/frontend
        area/backend
        area/docs
        area/unknown
        area/other
    secrets:
      OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
      GH_TOKEN: ${{ secrets.TOKEN }}
```

## Worked Example: Elaborate a GitHub issue, ask the user to add details

This will only comment on the issue:

```
on:
  issues:
    types:
      - opened

jobs:
  elaborate_issue:
    uses: moxious/chatgpt-cli-action/.github/workflows/elaborate-issue.yml@main
    with:
      url: ${{ github.event.issue.html_url }}
    secrets:
      OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
      GH_TOKEN: ${{ secrets.TOKEN }}

# General Inputs

## Inputs

The "type" and "url" are used to fetch github text status from any kind of endpoint.

## `type`

The kind of github thing you're trying to operate on, e.g. 'issue'

## `url`

The url of the github thing you're operating on, e.g. https://github.com/grafana/grafana/issues/77598

## `prompt`

The context to give to ChatGPT.  The type & URL will be the inputs to chatgpt, the "prompt" is the command you
are giving the bot.  For example,

```
prompt: "Summarize the issue", 
type: "issue",
url: "https://github.com/grafana/grafana/issues/77598
```

## Outputs

## `output`

The full text of the response

## Example usage

See `.github/workflows/main.yml` in this repo.