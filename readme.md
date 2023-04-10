# Server Side

The server side of our warehouse management system is responsible for handling data and business logic. It acts as a central hub for all data processing and communication between clients and the database.
Technology Stack

We have chosen to implement the server side of our warehouse management system using the following technologies:


## Tech Stack

**Client:** React & TailwindCSS

**Server:** Laravel
   

# Architecture

Our server side architecture follows the Model-View-Controller (MVC) pattern, which separates the application into three interconnected components:

    Models - handle data storage and retrieval from the database
    Views - render dynamic content and serve HTML templates to the client
    Controllers - process requests from the client, interact with the models, and generate appropriate responses

We have also incorporated a service layer, which acts as a bridge between the controllers and the models. This allows us to separate business logic from data access, making the application more modular and easier to maintain.
API Endpoints

Our server side exposes a RESTful API, which allows clients to communicate with the database using HTTP requests. Here are some of the key endpoints of our API:
    
    GET /api/products - retrieves a list of all products in the warehouse
    GET /api/products/:id - retrieves details of a specific product
    POST /api/products - adds a new product to the warehouse
    PUT /api/products/:id - updates details of an existing product
    DELETE /api/products/:id - removes a product from the warehouse
    


# Deployment

Our server side is designed to be deployed on cloud platforms such as Amazon Web Services (AWS) and Microsoft Azure. We recommend using a containerization platform such as Docker, for easy deployment and scalability.
Contributing

We welcome contributions to our server side codebase! Please read our Contributing Guidelines before submitting any pull requests.

## API Reference

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### add(num1, num2)

Takes two numbers and returns the sum.

