import 'package:asp/asp.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/models/new_user_model.dart';

//Atoms --------------------
final authStatusAtom = Atom<AuthState>(AuthState.INICIAL);
final userIsLogAtom = Atom<bool>(false);
//final userIsLogAtom = Atom<bool>(true);
final authOptionsAtom = Atom<AuthChengePage>(AuthChengePage.LOGIN);
final errorAtom = Atom<String>('');
final loggedUserAtom =
    Atom<AuthUserModel>(AuthUserModel(email: '', password: ''));
//final loggedUserAtom = Atom<AuthUserModel>(AuthUserModel(email: 'samuel@teste.com', password: '123321'));

//Actions -----------------
final authUserCreateAction =
    Atom<AuthUserModel>(AuthUserModel(email: '', password: ''));
final exitAppAction = Atom.action();
