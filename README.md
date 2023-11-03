# chatgpt-cli-action

This is a GitHub action based on [https://github.com/marcolardera/chatgpt-cli](chatgpt-cli) that allows
for easy GitHub actions application of ChatGPT to GitHub objects such as issues.

```
docker build -t moxious/chatgpt-cli-action . && docker push moxious/chatgpt-cli-action
```

## Inputs

No inputs currently required; gathered from env

## `issue-url`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: actions/hello-world-docker-action@v2
with:
  who-to-greet: 'Mona the Octocat'