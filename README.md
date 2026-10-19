# onctl-action-hello
Hello World Action

## Usage

Add the action to a workflow step and pass the `name` input:

```yaml
steps:
  - name: Say hello
    uses: cdalar/onctl-action-hello@v1.0.0
    with:
      name: World
```
