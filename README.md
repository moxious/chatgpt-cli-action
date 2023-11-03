# chatgpt-cli-action

This is a GitHub action based on [https://github.com/marcolardera/chatgpt-cli](chatgpt-cli) that allows
for easy GitHub actions application of ChatGPT to GitHub objects such as issues.

```
docker build -t moxious/chatgpt-cli-action . && docker push moxious/chatgpt-cli-action
```

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