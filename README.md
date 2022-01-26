This is a chat application in which the user can create applications full of chats and messages
The application consists of a few CRUD implementations for applications, chats and messages

How to run the application:

run docker-compose build ===>
to install all needed modules and build the application
run docker-compose up ===> 
this starts the all services (after connecting the database close it using ctrl+C)
run docker-compose run web rails db:migrate ===>
this initializes the database models by pushing all the migrations
rerun docker-compose up again to run the app

Notes:
I have never used Ruby on Rails before so this was very challenging for me to learn everything from scratch while implementing the task so I hope you take this into account while judging it.
I had an issue with the installation and setup of elasticsearch. Also with creating the queries in Ruby. I used it extensively in NodeJS so I know how to implement the query but not how to write it. I thought I would write it for you here in the normal object syntax since I wasn't able to do it there.

query = {
    bool: {
        filter: [
            {
                term: {
                    application_token: { value: application_token }
                }
            },
            {
                term: {
                    chat_id: { value: chat_id }
                }
            },
            {
                match: {
                    body: {
                        query: keyword,
                        fuzziness: AUTO,
                        operator: AND (for more accurate results)     
                    }
                }
            },
        ]
    }
}