***** PLEASE CONSIDER THIS BEFORE YOU USE THIS REPO ************
after you clone this repo , 
open repo and go to it's terminal
run this command *flutter pub get * to get all dependencies
visit appwrite website , create an account after create a project and register it according to appwrite documentation
create database and collection
go to your codes and navigate to appwrite folder in constants folder located in lib folder create a document there
called 'appwrite_constants.dart'
create a class like this and go pass in your values
class AppwriteConstants {
  static const String appwriteProjectId = " ";
  static const String appwriteDatabaseId = ' ';
  static const String appwriteUrl = "https://cloud.appwrite.io/v1";
  static const String collectionUsers = ' ';
}
