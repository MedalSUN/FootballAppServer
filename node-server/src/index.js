const express = require('express')
const { postgraphile } = require('postgraphile')
const bodyParser = require('body-parser')
const cors = require('cors')
var fetch = require('node-fetch')
const app = express()
const PostGraphileConnectionFilterPlugin = require('postgraphile-plugin-connection-filter')
const { mapGETtoPOST } = require('./modules/get-to-post-middleware')

process.env.POSTGRES_USERNAME = 'postgres',
// process.env.POSTGRES_PASSWORD = 'picsecret!',
process.env.POSTGRES_PASSWORD = 'postgres',
// for local dev
// process.env.POSTGRES_HOST = 'localhost',
process.env.POSTGRES_HOST = 'postgres',
// process.env.POSTGRES_HOST = 'stagingdb.cvqoyzhnzibt.ap-southeast-2.rds.amazonaws.com',

process.env.POSTGRES_PORT = '5432',
process.env.POSTGRES_DATABASE = 'postgres'
process.env.PORT = 5000
process.env.POSTGRAPHQL_SCHEMA = ['ca']
process.env.JWT_SECRET = 'local_secret'
// process.env.POSTGRAPHQL_DEFAULT_ROLE = 'postgres'
process.env.POSTGRAPHQL_DEFAULT_ROLE = 'ca_anonymous'
process.env.ALLOW_GRAPHIQL = 'yes'

const postgresConfig = {
  user: process.env.POSTGRES_USERNAME,
  password: process.env.POSTGRES_PASSWORD,
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DATABASE
}

const allowGraphIQL = process.env.ALLOW_GRAPHIQL === 'yes'
if(allowGraphIQL) {
  console.warn('WARNING!! GraphIQL is enabled on this server!')
}

const dbUrl = `postgres://${process.env.POSTGRES_USERNAME}:${process.env.POSTGRES_PASSWORD}@${process.env.POSTGRES_HOST}:${process.env.POSTGRES_PORT}/${process.env.POSTGRES_DATABASE}`

function getFacebookAccountData (facebookToken) {
  console.log('start get facebook account')
  // The info we can get from facebook
  // https://developers.facebook.com/docs/graph-api/reference/v2.2/user
  return fetch(
    `https://graph.facebook.com/v2.9/me?fields=id%2Cemail%2Cfirst_name%2Clast_name&access_token=${facebookToken}`)
    .then(response => response.json())
    .then((parsedResponse) => {
    // console.log('parsedResponse is:', parsedResponse)
      if (parsedResponse.error) {
        return Promise.reject(parsedResponse.error.message)
      } else {
        return parsedResponse
      }
    })
}

app.use(cors())

app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
  next()
})

app.use(bodyParser.json())


// facebook login
// app.use(function (req, res, next) {
//   // console.log('req is:', req)
//   if (req.body.variables) {
//     let facebookToken = req.body.variables.facebookToken
//     // let variables = req.body.variables;
//     // console.log('body is:', req.body.variables.facebookToken)

//     if (facebookToken) {
//       getFacebookAccountData(facebookToken)
//       .then((facebookUser) => {
//         // console.log('facebookUser is:', facebookUser)
//         // console.log('facebookUser email is:', facebookUser.email)
//         req.body.variables.email = facebookUser.email
//         req.body.variables.facebookId = facebookUser.id
//         req.body.variables.firstName = facebookUser.first_name
//         req.body.variables.lastName = facebookUser.last_name
//         // console.log('111 next:', req.body.variables)
//         next()
//       }).catch((error) => {
//         console.log(error)

//         // don't expose error message to client!
//         return {
//           error: 'An unexpected error occured.'
//         }
//       })
//     } else {
//       next()
//     }
//   } else {
//     // console.log('333 next:', req.body.variables)
//     next()
//   }
// })

// app.use(postgraphile(
//   postgresConfig,
//   process.env.POSTGRAPHQL_SCHEMA, {
//     graphiql: true,
//     watchPg: true,
//     jwtPgTypeIdentifier: `${process.env.POSTGRAPHQL_SCHEMA}.jwt`,    
//     jwtSecret: process.env.JWT_SECRET,
//     pgDefaultRole: process.env.POSTGRAPHQL_DEFAULT_ROLE
//   }))

// app.use(mapGETtoPOST(postgraphile(dbUrl, 'public', options)))

// @see https://github.com/graphile-contrib/postgraphile-plugin-connection-filter
const filterOptions = {
  connectionFilterAllowedOperators: [
    "isNull",
    "equalTo",
    "notEqualTo",
    "lessThan",
    "lessThanOrEqualTo",
    "greaterThan",
    "greaterThanOrEqualTo",
    "in",
    "notIn",
    "and",
    "or",
    "startsWith",
    "startsWithInsensitive"
  ],
  connectionFilterSetofFunctions: false,
  connectionFilterComputedColumns: false
}


// @see https://www.graphile.org/postgraphile/usage-library/
const options = {
  watchPg: true,
  pgDefaultRole: allowGraphIQL ? process.env.POSTGRAPHQL_DEFAULT_ROLE : process.env.POSTGRAPHQL_DEFAULT_ROLE,
  dynamicJson: true,
  appendPlugins: [ PostGraphileConnectionFilterPlugin ],
  graphiql: allowGraphIQL,
  jwtSecret: process.env.JWT_SECRET,
  jwtPgTypeIdentifier: `${process.env.POSTGRAPHQL_SCHEMA}.jwt`,
  graphileBuildOptions:{
    ...filterOptions
  }
}

app.use(mapGETtoPOST(postgraphile(dbUrl, 'ca', options)))

app.use(function (req, res, next) {
  var err = new Error('Not Found')
  err.status = 404
  next(err)
})

app.use(function (err, req, res, next) {
  console.log('error is:', err)
  res.send('Error! ', err.message, ' ', (req.app.get('env') === 'development' ? err : {}))
})


app.get('/', (req, res) => {
  res.send('Hello ca!')
})
app.listen(process.env.PORT)
// app.listen(4000, () => console.log('Server running'));
