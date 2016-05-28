# Loopback Component Current User

This loopback component enables you to add the logined(current) user to the request of thhe loopback application.

### Installation

1. Install in you loopback project:

  `npm install --save loopback-component-current-user`

2. Create a component-config.json file in your server folder (if you don't already have one)

3. Configure options inside `component-config.json`:

  ```json
  {
    "loopback-component-current-user": {
      "user": "User"
    }
  }
  ```
  - `user`
    * [String] : The name of the user model. *(default: 'User')*


4. Create a middleware.json file in your server folder (if you don't already have one).

5. Ensure that you enable the `loopback#token` middleware early in your middleware chain.

  ```json
  {
    "initial:before": {
      "loopback#token": {}
    },
  }
  ```

### Usage

```js

Model.beforeRemote('*', function(ctx, next){
  console.log(ctx.req.currentUser)
})

```


