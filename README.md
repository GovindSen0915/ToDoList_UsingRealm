# ToDoList_UsingRealm

Simulator Demo
:-------------------------:
https://github.com/GovindSen0915/ToDoList_UsingRealm/assets/85836893/0e050ef3-49d8-462c-9872-aee5f4f76d20

**Project Overview:**

- **Introduction:**
  - This iOS app is designed to manage a list of contacts, allowing users to add, edit, and delete contact entries.

- **Technologies Used:**
  - The app is built using Swift and utilizes the UIKit framework for the user interface.
  - It employs RealmSwift, a mobile database, to store and manage contact data.

- **Features:**
  - **Contact Management:**
    - Users can add new contacts with first and last names.
    - Contacts can be edited or updated.
    - Contacts can be deleted from the list.

  - **User Interface:**
    - The app presents a simple table view for displaying the list of contacts.
    - Users can swipe to reveal contextual actions for editing or deleting contacts.

- **Code Structure:**
  - The app follows a Model-View-Controller (MVC) architectural pattern.
  - Key components:
    - `ViewController`: The main view controller managing the contact list and user interactions.
    - `Contact` class: Represents a contact with first and last names, utilizing RealmSwift for data persistence.
    - `DatabaseHelper` class: A singleton class handling database operations using RealmSwift.

- **Usage:**
  - Clone the repository and open the project in Xcode.
  - Build and run the app on a compatible iOS device or simulator.
  - Use the app to manage your list of contacts, including adding, editing, and deleting entries.

This README provides a concise overview of your iOS app and its codebase, making it easier for others to understand and contribute to your project. Make sure to replace placeholders with specific details as needed.
