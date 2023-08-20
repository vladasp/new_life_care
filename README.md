# New Life Care App

![App Demo](https://github-production-user-asset-6210df.s3.amazonaws.com/12842822/261858439-8bd30823-4fc4-4e38-bc2c-36920bbd3901.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230820%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230820T143657Z&X-Amz-Expires=300&X-Amz-Signature=f7b95997f890f559ed47f2c5c169ce73d248f91b0ae45c34ee90792bb5b1ab31&X-Amz-SignedHeaders=host&actor_id=12842822&key_id=0&repo_id=622651184)

New Life Care is a Flutter-based mobile app designed to provide a seamless experience for users to navigate through different screens and make selections. The app utilizes the BLoC (Business Logic Component) library to manage state and screen navigation. The final screen of the app displays a summary of selections made on the previous two screens.

## Screens

### Screen 1: Welcome and Selections
On this screen, users are greeted and presented with options to make selections that are relevant to their preferences. They can input various details and preferences that will be used in the subsequent screens.

### Screen 2: Further Customizations
This screen builds upon the selections made in the previous screen. Users are provided with additional options to refine their preferences. The selections made here will be used to tailor the user experience in the final summary screen.

### Screen 3: Summary
The last screen presents users with a summary of their selections from the previous screens. It consolidates the chosen options and displays them in text fields. Users can review their choices before finalizing and proceeding.

## Getting Started

To run the New Life Care app locally, follow these steps:

1. Clone this repository to your local machine.
2. Make sure you have Flutter and Dart installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install) to set up your environment.
3. Open the project in your preferred IDE or text editor.
4. Run `flutter pub get` to fetch the required dependencies.
5. Connect a device or start an emulator.
6. Run `flutter run` in the terminal within the project directory.

## Dependencies

The New Life Care app utilizes the following dependencies:

- `flutter_bloc`: For managing the BLoC architecture and state management.
- Other Flutter dependencies as required for UI components and navigation.

## Contributing

Contributions to New Life Care are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request in this repository.

## License

This project is licensed under the [MIT License](LICENSE).

---

Feel free to contact me for any questions or feedback. Happy coding!
