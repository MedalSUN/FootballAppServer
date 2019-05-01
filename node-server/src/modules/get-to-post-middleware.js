exports.mapGETtoPOST = (fn) => (req, res, next) => {
    console.log(req.originalUrl)
    if (req.method === 'GET' && req.originalUrl.indexOf('/graphiql') < 0 ) {
      req.method = 'POST'
      const payload = {
        query: req.query.query,
        operationName: req.query.operationName,
        variables: req.query.variables
      }
      const originalBody = req.body
      req.body = payload
      fn(req, res, (err) => {
        req.body = originalBody
        req.method = 'GET'
        next(err)
      })
    } else {
      fn(req, res, next)
    }
  }