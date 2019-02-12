const gql = require('nanographql');
const fetch = require('node-fetch');

const queryEntries = gql`
query {
  entries{
    id
    title
    body
    authorId
    comments {
      id
      body
      authorId
      createdAt
    }
    createdAt
  }
}`;
console.log(queryEntries({}));

const endpoint = 'http://localhost:2300/graph/graphql';
fetch(endpoint, {
  body: queryEntries({}),
  headers: { 'Content-Type': 'application/json' },
  method: 'POST'
})
  .then(res => res.json())
  .then(json => {
    if (json.errors) {
      json.errors.forEach((error) => { console.log(`[ERROR] error.message:${error.message}`); });
    } else {
      json.data.entries.forEach(entry => {
        console.log('------------------------------------------------');
        for (let [k,v] of Object.entries(entry)) {
          console.log(`[INFO]${k}:${v}`);
        }
      });
    }
  })
  .catch(err => { console.log(err); });

