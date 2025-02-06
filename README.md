#Features

Contact Creation: Users can add new contacts, including their name, phone number, and email address. The app appears to handle potential errors in input (e.g. non-numeric phone numbers).

Contact Listing/Display: The app displays a list of contacts, likely with a preview of their information (name, phone number and email).

Contact Deletion: Users can delete contacts from the list.

User Interface: The app has a user-friendly interface, with clear labels and intuitive navigation. It appears designed to be reasonably responsive.

Input Validation: Basic input validation is implemented, such as checking for empty fields and the correct format of the phone number and email.

#Flutter Tools Used

Flutter SDK: The core framework for building the app.

Dart Programming Language: The language used to write the app logic.

Flutter CLI: For running, building, and testing the app.

Android Studio : IDE for development and debugging.

Flutter DevTools: For performance profiling, debugging, and inspecting the widget tree.

#Flutter Widgets& packages Used

Lottie.asset: Used to display a Lottie animation as a placeholder image if no image is provided& in home page if it is impty. 

GridView.builder: used for building the contact list .

image_picker: used to allow users to select images from their device's gallery or take pictures using the camera

GestureDetector: Used to make the profile picture area tappable, triggering the image picker.

ClipRRect: Used to clip the selected image to a rounded rectangle, matching the styling of the placeholder.

Image.file: Used to display the selected image from the file.

ValueListenableBuilder: Used to rebuild the Text widgets displaying the contact information whenever the corresponding text editing controllers' values change. This allows for a "live" preview of the contact information.

Divider: Used to visually separate the contact details (name, email, phone).

Visibility: Used to conditionally display the floating action buttons. The showDelete and add boolean variables control whether each button is visible.

FloatingActionButton: Used to create the circular buttons for adding and deleting contacts. You've customized their appearance (background color, icon).

Icon: Used to display the icons (delete and add) within the FloatingActionButton widgets.

Form: Used to group the text fields for validation.
