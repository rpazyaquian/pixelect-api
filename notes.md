# API

## Models

### User

    has_many :image_sets
    has_many :images, through: :image_sets
    has_many :comments, through: :image_sets

- `devise` model
- Non-Devise Attributes
    - `email:string`

### Image Set

    has_many :images
    has_many :comments
    belongs_to :user

- Attributes
    - `question:string`
    - `user:belongs_to`

### Image

    belongs_to :image_set
    has_one :user, through: :image_set

- `voteable`
- Attributes
    - `url:string`
    - `image_set:belongs_to`

### Comment

    has_many :comments
    belongs_to :image_set
    belongs_to :comment
    has_one :user, through: :image_set

- Attributes
    - `text:text`
    - `image_set:belongs_to`
    - `comment:belongs_to`

## Routes

### Users

- GET `/users/`
- POST `/users/`
- GET `/users/:id`
- PUT/PATCH `/users/:id`
- DELETE `/users/:id`

### Image Sets

- GET `/image_sets`
- POST `/image_sets`
- GET `/image_sets/:id`
- DELETE `/image_sets/:id`

### Images

- GET `/image_sets/:image_set_id/images`

### Comments

- GET `/image_sets/:image_set_id/comments`
- POST `/image_sets/:image_set_id/comments`
- GET `/image_sets/:image_set_id/comments/:id`
- PUT/PATCH `/image_sets/:image_set_id/comments/:id`

## API Testing Requirements

- Test for User:
    - Can be created (`#create`)
    - What more, though?
    - Can log in
- Test for Image Set:
    - Can be indexed (`#index`)
    - Can be created (`#create`)
    - Can be read (`#show`)
    - Can be deleted (`#destroy`)
- Test for Image:
    - Nested under Image Set (`/image_sets/:image_set_id/images/`)
    - Can be indexed (`#index`)
    - ~~Can be created (`#create`)~~ Images
    - Can be read (`#show`)
    - Can be updated (`#update`) (for voting)
    - Deleted when Image Set is deleted
- Test for Comment:
    - Nested under Image Set (`/image_sets/:image_set_id/comments/`)
    - Can be indexed (`#index`)
    - Can be created (`#create`)
    - Can be read (`#show`)
    - Can be deleted (`#destroy`)
    - Deleted when Image Set is deleted