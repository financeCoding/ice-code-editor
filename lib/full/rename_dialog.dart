part of ice;

class RenameDialog {
  String name = 'Rename';
  var parent, ice, store;

  RenameDialog(Full full): this.fromParts(full.el, full.ice, full.store);
  RenameDialog.fromParts(this.parent, this.ice, this.store);

  open(){
    var dialog = new Element.html(
        '''
        <div class=ice-dialog>
        <label>Name:<input type="text" size="30" value="$_currentProjectName"></label>
        <button>Rename</button>
        </div>
        '''
    );

    dialog.query('button').onClick
      ..listen((_)=> _renameProjectAs(dialog.query('input').value))
      ..listen((_)=> _hideDialog());

    parent.children.add(dialog);

    dialog.query('input')
      ..focus();

  }

  _renameProjectAs(String projectName){
    var project = store.remove(_currentProjectName);
    store[projectName] = project;
  }

  String get _currentProjectName{
    if (store.isEmpty) return "Untitled";
    return store.projects.first['title'];
  }
}
