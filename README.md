iPhoneDev_Advanced_CoreNumber03
===============================
* Use model object NoteObj
  * Each instance of a NoteObj holds one note.
  * Each note contains:
    * a title
    * a note
    * an optional array or dictionary of photos
  * Use main-view-controller– NotesController
    * Besides managing the UI - the list of Notes, the NotesController must support: 
      * An array or dictionary of NoteObjs
      * Unarchiving/loading saved NoteObjs
      * deleting a Note/NoteObj
  * Use view-controller – NoteViewController– to support creating, viewing, and editing notes.
    * This controller manages the following:
      * Viewing a Note and if the note has one or more photos – displaying those photos.
      * Creating a new Note/NoteObj including with the following data:
        * The note
        * The Note Title
        * Adding one or more pictures into the note from either the camera or the camera roll.
      * Viewing and editing an existing Note/NoteObj.
      * Saving a new or edited note by archiving the model object – NoteObj into a file under your app’s documents directory in directory “MyNotes”.

### UI Specifications: 
* In the main-view-controller (NotesController):
  * Display a list/table of all saved notes – by title (see below)
    * if no saved notes exist yet, the table is empty
  * Add buttons:
    * Create Note
      * when selected; bring up another view the NoteViewController controller to support text entry and adding photos. 
    * Delete Note
      * Delete a note
    * To view or edit an existing note support a touch-up-inside event/action that displays the Note and its photos (if any) in the NoteViewController.
* Within NoteViewController support adding a new note and editing an existing Note. This view controller is displayed when the “Create Note” button is selected in the main-view-controller or the user taps an existing note.
  * Provide a way for the user to enter a multi-line note.
  * Provide a way for the user to enter a title for the new note – the user
must enter a title for the note before saving the note.
  * Provide a way for the user to add multiple photos from the camera and the camera roll – you must be able to support adding photos from both places in the same note.
  * Support editing the multi-line note, the title, adding/deleting photos from the Note.
    * You can add a “camera button” to support accessing the camera and camera roll
  * Add a Save button.
    * save the note by archiving the NoteObj in a file in your application's document folder in a sub-folder called “MyNotes” and return to the main-view controller.
    * NOTE: you can save a Note’s photos in the Note’s archive file – or you can save each photo in its own file (possibly in directory MyNotes/Photos). If you save photos in their own files – the Notes file can contain the filenames of the Note’s photos.
    * This new note should now be listed in the main-view-controller (NotesController) by title.
  * Have a Cancel Button
    * Immediately return to the main-view-controller without saving the note. 
 
