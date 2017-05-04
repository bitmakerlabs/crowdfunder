# User Stories

I copied the ones I think we should work on from the Alexa Page.

## Project owners

- As a user, when I create a new project I should become that project’s owner
- As a project owner, when I go to my project’s page, I should see a summary of how many rewards have been claimed
- As a project owner, when I create a new project, I should have the option of setting a limit for how many times a specific reward can be claimed
- As a project owner I should be able to post updates on the progess of my project.

## Project page

- As a backer I should be able to leave a comment on a project I have backed
- As a user, when I go to a project’s page, I should see how much money has been pledged so far
- As a user, when I go to a project’s page, it should tell me if I have already backed that project or not
- As a user, when I go to a project’s page, it should tell me how much time is left until the funding deadline (like it does on the project index currently)

## Validations

- description and dollar_amount should be required fields for rewards
- dollar_amount should be a required field for pledges
- Project start date must be in future
- Project end date must be later than start date
- A project's goal must be positive number
- Reward dollar_amount must be positive number
- Add error messages to the project, pledge, sign up, and login forms so that if any validations fail the user can see what went wrong

## UI

## Accounts

- As a user I should be able to visit my profile page and see a list of all the projects I have backed, the total amount I have pledged on the site, and a list of all the projects I own
- As a user, when I go to a project’s page, I should be able to see who the project’s owner is and follow a link to their profile page to see what other projects they own and have backed

## Emails

- As a backer, when I pledge towards a project, I should receive an email telling me how much I pledged and what reward I will receive
- As a project owner, when my project becomes fully funded, I should receive an email informing me
- As a project owner, when my project hits its deadline, I should receive an email telling me how much was pledged and whether the goal was hit
- As a backer, when a project I have backed becomes fully funded, I should receive an email informing me of this and a reminder of how much I will be charged
- As a backer, when a project I have backed hits its deadline, I should receive an email informing me how much was raised towards it and how much I will be charged. If the project didn’t meet its goal I should be informed that any pledges I made are cancelled.
- When a project owner posts an update on a project the people who backed that project should receive an email that contains the body of the update and a link to it
