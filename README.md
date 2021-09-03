<!-- ABOUT THE PROJECT -->
![swrpgc banner](https://user-images.githubusercontent.com/17935770/131261369-477cff64-39e5-462a-81bf-3f55944e512e.png)

This application acts as a companion for the tabletop rpg game: **Star Wars: Edge of the Empire**. The companion app allows you to keep track of and store your in-game characters. You may also connect and communicate with your friends and party up so that everyone can witness the dice rolls that will unfold the story in their legendary campaign.

This is the backend repository that is responsible for sending API responses to our [frontend application](https://github.com/SWRPG-Capstone/swrpg-fe).


![feaures](https://user-images.githubusercontent.com/17935770/131262008-e0fb73fa-3967-41bb-852d-6fd1f71b45a7.png)

 - User may create a new character that contains their information, characteristics, features
 - Dice rolls can be be configured with actual dice animation
 - All of your characters can be seen in one place

![preview](https://user-images.githubusercontent.com/17935770/131262055-e0e0afc1-09f9-4730-9f02-8cd4d7a2be09.png)

![Screenshots of the wireframe](https://user-images.githubusercontent.com/17935770/131262115-72dfe9c0-5bae-4c05-b65c-319b952bda52.png)


## About This Project
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About This Project</a>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#graphql-endpoints">GraphQL Endpoints</a></li>
    <li><a href="#Running-the-tests">Running the Tests</a></li>
  </ol>
</details>


#### Versions

- Ruby 2.7.2
- Rails 5.2.6

#### Important Gems
Testing
* factory-bot_rails
* faker
* pry
* shoulda-matchers
* simplecov
 
GRAPHQL API 
* graphql
* graphiql-rails
* rack-cors

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

## GraphQL Endpoints

Our GraphQL endpoints fall into three categories: queries, mutations, and filter queries.

To make live queries to the GraphQL endpoint and see live schema information, setup the back-end by running `rails s` in the terminal and access GraphiQL at http://localhost:3001/graphiql. Use the screenshots as reference when formatting your queries and compare against the expected response. 

### Queries 
 1. getCharacter(id: ID) - finds specific character in database by id. 
### REQUEST
```graphql 
 query{
  character(characterId: 1) {
    age 
    build
    career
    eyes
    hair
    height
    id
    name
    specialization
    species
  }
```
### RESPONSE 

```graphql
{
  "data": {
    "character": {
      "age": 15,
      "build": "Ezra Legros",
      "career": "Shonna Gleichner",
      "eyes": "Roxann Murray",
      "hair": "Rudolf Goyette II",
      "height": "Jaleesa Mann",
      "id": "1",
      "name": "Gov. Sook Kuhlman",
      "specialization": "Ellsworth Powlowski",
      "species": ""Larhonda Dietrich" 
    }
``` 

2. getUser(id: ID) - finds specific user in database by id.
![image](https://user-images.githubusercontent.com/74436194/131850866-7635834f-0294-4b2f-a435-1a91b45bbfaf.png)

3. getSkills(characterId: ID)
### REQUEST

```graphql 
query{
  skill(characterId: 1) {
    astrogation
    athletics
    brawl
    charm
    coercion
    computers
    cool
    coordination
    coreWorlds
    deception
    discipline
    education
    gunnery
    id
    leadership
    lore
    mechanics
    medicine
    melee
    negotiation
    outerRim
    perception
    piloting
    pilotingSpace
    rangedHeavy
    rangedLight
    resilience
    skulduggery
    stealth
    streetWise
    survival
    underworld
    vigilance
    xenology
  }
}
```

### RESPONSE

```graphql
{
  "data": {
    "skill": {
      "astrogation": 3,
      "athletics": 3,
      "brawl": 4,
      "charm": 4,
      "coercion": 3,
      "computers": 4,
      "cool": 2,
      "coordination": 5,
      "coreWorlds": 2,
      "deception": 5,
      "discipline": 2,
      "education": 2,
      "gunnery": 3,
      "id": "1",
      "leadership": 4,
      "lore": 4,
      "mechanics": 5,
      "medicine": 2,
      "melee": 5,
      "negotiation": 2,
      "outerRim": 1,
      "perception": 3,
      "piloting": 1,
      "pilotingSpace": 5,
      "rangedHeavy": 2,
      "rangedLight": 5,
      "resilience": 5,
      "skulduggery": 3,
      "stealth": 4,
      "streetWise": 2,
      "survival": 1,
      "underworld": 1,
      "vigilance": 5,
      "xenology": 3
    }
  }
}
```
4. getUserCharacters(id: ID) - finds all of the characters for a user by user id.
### Request

```graphql

{
  user(id: 1) {
    username
    characters {
      age
      build
      career
      eyes
      hair
      height
      id
      name
      specialization
      species
    }
  }
}
```
### Response
```graphql

{
  "data": {
    "user": {
      "username": "Prof. Rosalyn Rodriguez",
      "characters": [
        {
          "age": 80,
          "build": "Cruz Renner",
          "career": "Libby Gorczany DO",
          "eyes": "Milford Daniel DC",
          "hair": "Belkis Quitzon DC",
          "height": "Lynda Abbott",
          "id": "1",
          "name": "Jack Cummings",
          "specialization": "Sara Hudson",
          "species": "Rev. Manual Hackett"
        },
        {
          "age": 83,
          "build": "Mimi Toy",
          "career": "Dennis Prohaska II",
          "eyes": "Marcelle Lubowitz III",
          "hair": "Collette Bartell LLD",
          "height": "Roxann Kilback",
          "id": "2",
          "name": "Meda Miller",
          "specialization": "Dr. Jasmin Bailey",
          "species": "Guadalupe Fritsch"
        },
        {
          "age": 17,
          "build": "Shiela Nader",
          "career": "Alexis Legros",
          "eyes": "Katelynn Braun DC",
          "hair": "Andrea Stiedemann",
          "height": "Jaunita Effertz",
          "id": "3",
          "name": "Randy Russel",
          "specialization": "Renato Heaney",
          "species": "Ray Larkin"
        },
        {
          "age": 80,
          "build": "Robin Ritchie",
          "career": "Trinidad West",
          "eyes": "Debera McLaughlin",
          "hair": "Corey Wolff",
          "height": "Isreal Kunze",
          "id": "4",
          "name": "Hector Thiel",
          "specialization": "Jalisa Gutmann DVM",
          "species": "Monty Corkery"
        },
        {
          "age": 87,
          "build": "Carlos Quigley",
          "career": "Msgr. Leota Nitzsche",
          "eyes": "Everett Ernser",
          "hair": "Ayesha O'Reilly",
          "height": "Rosetta Armstrong",
          "id": "5",
          "name": "Marianne Gislason JD",
          "specialization": "Clarence Upton IV",
          "species": "Kera Funk"
        }
      ]
    }
  }
}
```

### Mutations 
1. createCharacter(CreateCharacterInput) - creates new character in database.
<img width="1389" alt="Screen Shot 2021-09-01 at 10 59 55 AM" src="https://user-images.githubusercontent.com/70981102/131714475-c2f81b53-3329-433c-947e-cc6640fa095d.png">

2. createCharacteristic(CreateCharacteristicInput) - creates new characteristic in database.
![image](https://user-images.githubusercontent.com/74436194/131943128-298c2837-0ca1-4859-86e2-de73dc832105.png)

3. createSkill(characterId: ID)
### REQUEST
```graphql  

mutation { 
      skill: createSkill(
       input:{
        characterId: 1
        astrogation: 1
        athletics: 1
        brawl: 1
        charm: 1
        coercion: 1
        computers: 1
        cool: 1
        coordination: 1
        coreWorlds: 1
        deception: 1
        discipline: 1
        education: 1
        gunnery: 1
        leadership: 1
        lore: 1
        mechanics: 1
        medicine: 1
        melee: 4
        negotiation: 1
        outerRim: 1
        perception: 1
        piloting: 1
        pilotingSpace: 1
        rangedHeavy: 2
        rangedLight: 3
        resilience: 4
        skulduggery: 5
        stealth: 2
        streetWise: 2
        survival: 1
        underworld: 1
        vigilance: 1
        xenology: 1
       }) {							  
        astrogation
        athletics
        brawl
        charm
        coercion
        computers
        cool
        coordination
        coreWorlds
        deception
        discipline
        education
        gunnery
        id
        leadership
        lore
        mechanics
        medicine
        melee
        negotiation
        outerRim
        perception
        piloting
        pilotingSpace
        rangedHeavy
        rangedLight
        resilience
        skulduggery
        stealth
        streetWise
        survival
        underworld
        vigilance
        xenology
   }
}

 ```
 
 ### RESPONSE
```graphql
{
  "data": {
    "skill": {
      "astrogation": 1,
      "athletics": 1,
      "brawl": 1,
      "charm": 1,
      "coercion": 1,
      "computers": 1,
      "cool": 1,
      "coordination": 1,
      "coreWorlds": 1,
      "deception": 1,
      "discipline": 1,
      "education": 1,
      "gunnery": 1,
      "id": "9",
      "leadership": 1,
      "lore": 1,
      "mechanics": 1,
      "medicine": 1,
      "melee": 4,
      "negotiation": 1,
      "outerRim": 1,
      "perception": 1,
      "piloting": 1,
      "pilotingSpace": 1,
      "rangedHeavy": 2,
      "rangedLight": 3,
      "resilience": 4,
      "skulduggery": 5,
      "stealth": 2,
      "streetWise": 2,
      "survival": 1,
      "underworld": 1,
      "vigilance": 1,
      "xenology": 1
    }
  }
}
```

3. updateSkill(UpdateSkillInput) - updates any/all of the skills for a specified character.
> Pasting code instead of screenshot due to the code not all fitting in one shot

#### REQUEST
```graphql
  mutation {
    updateSkill(input: {
      astrogation: 5,
      athletics: 5,
      brawl: 5,
      characterId: 1,
      charm: 5,
      coercion: 5,
      computers: 5,
      cool: 5,
      coordination: 5,
      coreWorlds: 5,
      deception: 5,
      discipline: 5,
      education: 5,
      gunnery: 5,
      id: 1,
      leadership: 5,
      lore: 5,
      mechanics: 5,
      medicine: 5,
      melee: 5,
      negotiation: 5,
      outerRim: 5,
      perception: 5,
      piloting: 5,
      pilotingSpace: 5,
      rangedHeavy: 5,
      rangedLight: 5,
      resilience: 5,
      skulduggery: 5,
      stealth: 5,
      streetWise: 5,
      survival: 5,
      underworld: 5,
      vigilance: 5,
      xenology: 5
    }) {
      astrogation
      athletics
      brawl
      characterId
      charm
      coercion
      computers
      cool
      coordination
      coreWorlds
      deception
      discipline
      education
      gunnery
      id
      leadership
      lore
      mechanics
      medicine
      melee
      negotiation
      outerRim
      perception
      piloting
      pilotingSpace
      rangedHeavy
      rangedLight
      resilience
      skulduggery
      stealth
      streetWise
      survival
      underworld
      vigilance
      xenology
    }
  }
```

#### RESPONSE
```graphql
 {
   "data": {
     "updateSkill": {
        "astrogation": 5,
        "athletics": 5,
        "brawl": 5,
        "characterId": 1,
        "charm": 5,
        "coercion": 5,
        "computers": 5,
        "cool": 5,
        "coordination": 5,
        "coreWorlds": 5,
        "deception": 5,
        "discipline": 5,
        "education": 5,
        "gunnery": 5,
        "id": "1",
        "leadership": 5,
        "lore": 5,
        "mechanics": 5,
        "medicine": 5,
        "melee": 5,
        "negotiation": 5,
        "outerRim": 5,
        "perception": 5,
        "piloting": 5,
        "pilotingSpace": 5,
        "rangedHeavy": 5,
        "rangedLight": 5,
        "resilience": 5,
        "skulduggery": 5,
        "stealth": 5,
        "streetWise": 5,
        "survival": 5,
        "underworld": 5,
        "vigilance": 5,
        "xenology": 5
      }
    }
  }
```

## Running the tests
