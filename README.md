# huynh_duy_khang_home_assignment

# Weather Forecast App

This project is a **Weather Forecast App** built using **Flutter** and **Dart**. 
It provides weather forecasts for future dates.

## Features
- Fetch and display future weather forecasts.
- Organized and reusable codebase using **MVVM**.
- JSON serialization/deserialization for API communication.
- Custom UI components with consistent theming.

## Architectural Pattern
The project follows the **MVVM** pattern, which separates the codebase into distinct layers:
1. **View**: The UI layer responsible for displaying data and handling user interactions. It observes the ViewModel for changes and updates the UI accordingly.
2. **ViewModel**: The layer that acts as a bridge between the View and the Model. It handles the business logic, processes data, and prepares it for presentation in the View. The ViewModel exposes observable properties that the View binds to, enabling automatic UI updates when the data changes.
3. **Model**: The layer that manages the data. It is responsible for data fetching, storage, and manipulation, including interaction with APIs, databases, or other data sources.

This architecture ensures:
- High testability.
- Separation of concerns.
- Scalability and maintainability.

## Libraries and Frameworks
The project uses the following libraries and frameworks:
- **Flutter**: For building the cross-platform UI.
- **Dart**: The programming language for Flutter.
- **json_serializable**: For generating JSON serialization/deserialization code.
- **Provider**: For state management, allowing the ViewModel to notify the View of changes.
- **Material Design**: For consistent UI components and theming.

## DTOs (Data Transfer Objects)
- **`TemperatureDto`**: Represents temperature data with fields like `temp`, `temp_min`, `temp_max`, `pressure`, and `humidity`.
- **`FutureWeatherListDto`**: Represents a list of future weather items.
- **`FutureWeatherItemDto`**: Represents individual weather data with fields like `main` (temperature - TemperatureDto) and `dt_txt` (date-time - DateTime).
- **`WeatherDto`**: Represents individual weather data with fields like `main` (temperature - TemperatureDto) and `name` (cityName - String).
- **`ErrorDto`**: Represents error with fields like `error` (error list - List<String>).

## Utilities
- **`ColorUtils`**: Provides a set of predefined colors for consistent theming across the app.
- **`ApiUtils`**: Handle errors and return results when calling the API.
- **`StringUtils`**: Format data types to String according to the desired format.

## UI model
- Get some field to display on the UI from DTOs.

## Project Structure
lib/ 
├── core
    ├── api
        ├── api_interceptor.dart
        ├── rest_client.dart
        ├── rest_client.g.dart
    ├── dtos
    ├── services
        ├── implementations
        ├── interfaces
    ├── ui_model
    ├── view_models
        ├── implementations
        ├── interfaces
├── global
    ├── global_data.dart
    ├── locator.dart
    ├── locator_service.dart
    ├── my_router_observer.dart
    ├── providers.dart
    ├── router.dart
├── ui
    ├── common
        ├── loading_widget
    ├── screens
        ├── error_screen
        ├── weather_info_screen
            ├── widgets
                ├── temperature_widget.dart
                ├── temperature_list.dart
            ├── weather_info_body.dart
            ├── weather_info_screen.dart
├── utils
    ├── api_utils.dart
    ├── color_utils.dart
    ├── string_utils.dart
├── main.dart