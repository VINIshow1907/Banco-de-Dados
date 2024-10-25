use primeiro
'switched to db primeiro'
db.pessoa.insertOne({
  nome:"Vinicius",
  idade:19
})
{
  acknowledged: true,
  insertedId: ObjectId("671aa6672de6084bf740402d")
}
show dbs
Loja_eletronicos   76.00 KiB
admin              40.00 KiB
config            108.00 KiB
local             104.00 KiB
primeiro           40.00 KiB
show collections
pessoa
db.getCollectionNames
[Function: getCollectionNames] AsyncFunction {
  apiVersions: [ 1, Infinity ],
  returnsPromise: true,
  serverVersions: [ '0.0.0', '999.999.999' ],
  topologies: [ 'ReplSet', 'Sharded', 'LoadBalanced', 'Standalone' ],
  returnType: { type: 'unknown', attributes: {} },
  deprecated: false,
  platforms: [ 'Compass', 'Browser', 'CLI' ],
  isDirectShellCommand: false,
  acceptsRawInput: false,
  shellCommandCompleter: undefined,
  help: [Function (anonymous)] Help
}
db.getCollectionNames()
[ 'pessoa' ]
db.pessoa.find()
{
  _id: ObjectId("671aa6672de6084bf740402d"),
  nome: 'Vinicius',
  idade: 19
}
db.pessoa.insertOne({
  nome:"Maria",
  endereco:{rua:"7", numero:"275", bairro:"Centro"},
  telefone:["99715-1825", "997287745"],
  idade: 40
  
})
{
  acknowledged: true,
  insertedId: ObjectId("671aa9ab2de6084bf740402e")
}
db.pessoa.find({},{nome:1})
{
  _id: ObjectId("671aa6672de6084bf740402d"),
  nome: 'Vinicius'
}
{
  _id: ObjectId("671aa9ab2de6084bf740402e"),
  nome: 'Maria'
}
db.pessoa.InsertMany([
  {nome:"Helena", idade:20},
  {nome:"Lucas", idade:27},
  {nome:"Bruno", idade:36},
  {nome:"Elaine", idade:60}
  ])
TypeError: db.pessoa.InsertMany is not a function
db.pessoa.InsertMany([
  {nome:"Helena", idade:20},
  {nome:"Lucas", idade:27},
  {nome:"Bruno", idade:36},
  {nome:"Elaine", idade:60},
  ])
TypeError: db.pessoa.InsertMany is not a function
db.pessoa.insertMany([
  {nome:"Helena", idade:20},
  {nome:"Lucas", idade:27},
  {nome:"Bruno", idade:36},
  {nome:"Elaine", idade:60},
  ])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("671aac862de6084bf740402f"),
    '1': ObjectId("671aac862de6084bf7404030"),
    '2': ObjectId("671aac862de6084bf7404031"),
    '3': ObjectId("671aac862de6084bf7404032")
  }
}
db.pessoa.find({},{ _id:0, nome:1})
{
  nome: 'Vinicius'
}
{
  nome: 'Maria'
}
{
  nome: 'Helena'
}
{
  nome: 'Lucas'
}
{
  nome: 'Bruno'
}
{
  nome: 'Elaine'
}
db.pessoa.insertOne(nome:"Lucas")
Error: clone(t={}){const r=t.loc||{};return e({loc:new Position("line"in r?r.line:this.loc.line,"column"in r?r.column:...<omitted>...)} could not be cloned.
db.pessoa.deleteOne({nome:"Lucas"})
{
  acknowledged: true,
  deletedCount: 1
}
db.pessoa.find({},{ _id:0, nome:1})
{
  nome: 'Vinicius'
}
{
  nome: 'Maria'
}
{
  nome: 'Helena'
}
{
  nome: 'Bruno'
}
{
  nome: 'Elaine'
}
db.pessoa.deleteMany({}({nome:"Lucas"}))
TypeError: {} is not a function
db.pessoa.find({},{ _id:0, nome:1})
{
  nome: 'Vinicius'
}
{
  nome: 'Maria'
}
{
  nome: 'Helena'
}
{
  nome: 'Bruno'
}
{
  nome: 'Elaine'
}
db.pessoa.find({nome:"Bruno"})
{
  _id: ObjectId("671aac862de6084bf7404031"),
  nome: 'Bruno',
  idade: 36
}
db.pessoa.updateOne({nome:"Bruno"},
)
MongoInvalidArgumentError: Update document requires atomic operators
 
 
 
db.pessoa.updateOne({nome:"Bruno"},
{set:{teleone:["92222-3333"],
  idade: 42
  
}}
)








MongoInvalidArgumentError: Update document requires atomic operators
db.pessoa.updateOne({nome:"Bruno"},
{$set:{teleone:["92222-3333"],
  idade: 42
  
}}
)








{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
db.pessoa.updateOne({nome:"Bruno"},
{$unset:{telefone:[]}}
)
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 0,
  upsertedCount: 0
}
db.pessoa.find()



{
  _id: ObjectId("671aa6672de6084bf740402d"),
  nome: 'Vinicius',
  idade: 19
}
{
  _id: ObjectId("671aa9ab2de6084bf740402e"),
  nome: 'Maria',
  endereco: {
    rua: '7',
    numero: '275',
    bairro: 'Centro'
  },
  telefone: [
    '99715-1825',
    '997287745'
  ],
  idade: 40
}
{
  _id: ObjectId("671aac862de6084bf740402f"),
  nome: 'Helena',
  idade: 20
}
{
  _id: ObjectId("671aac862de6084bf7404031"),
  nome: 'Bruno',
  idade: 42,
  teleone: [
    '92222-3333'
  ]
}
{
  _id: ObjectId("671aac862de6084bf7404032"),
  nome: 'Elaine',
  idade: 60
}